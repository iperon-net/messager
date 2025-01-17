import 'package:bloc/bloc.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger/db/models.dart';

import '../analytics.dart';
import '../api/api.dart';
import '../db/db.dart';
import '../injection.dart';
import '../logger.dart';
import '../protobuf/protos/auth.pb.dart';
import '../protobuf/protos/models.pb.dart';
import '../protobuf/protos/server.pb.dart';
import '../utils.dart';

part 'auth_confirmation_cubit.freezed.dart';
part 'auth_confirmation_state.dart';

@injectable
class AuthConfirmationCubit extends Cubit<AuthConfirmationState> {
  AuthConfirmationCubit() : super(const AuthConfirmationState.initial());

  final textControllerCode = TextEditingController();
  final logger = getIt.get<Logger>();
  final utils = getIt.get<Utils>();

  String? validationCode(BuildContext context, String? value) {
    if (value == null || value.isEmpty) return context.tr('enterValidCode');
    if (value.length != 6) return context.tr('enterValidCode');

    RegExp exp = RegExp(r'^[0-9]{6}$');
    RegExpMatch? match = exp.firstMatch(value);
    if (match == null) return context.tr('enterValidCode');

    return null;
  }

  Future<void> validator(
      BuildContext context,
      GlobalKey<FormState> formKeyAuth,
      TextEditingController textControllerCode,
      String signInToken,
  ) async {
    if (!formKeyAuth.currentState!.validate()) return;

    if(!utils.isDebug) textControllerCode.clear();

    API api = getIt.get<API>();

    // api.authClient.confirmation(request);
    final code = textControllerCode.text;

    Logger logger = getIt.get<Logger>();
    UsersDB usersDB = getIt.get<UsersDB>();
    Analytics analytics = getIt.get<Analytics>();

    AuthConfirmationResponse responseConfirmation = AuthConfirmationResponse();

    String errAuthConfirmation = await api.call(() async {
      responseConfirmation = await api.authClient.confirmation(AuthConfirmationRequest(
          signInToken: signInToken,
          code: int.parse(code),
      ));
    });

    if (errAuthConfirmation.isNotEmpty) {
      emit(AuthConfirmationState.initial(error: errAuthConfirmation.toString(), loading: false));
      return;
    }

    logger.debug(responseConfirmation.accessToken);
    logger.debug(responseConfirmation.refreshToken);

    // Server info
    ServerInfoResponse responseServerInfo = ServerInfoResponse();
    String errServerInfo = await api.call(() async {
      responseServerInfo = await api.serverClient.info(EmptyRequest());
    });

    if (errServerInfo.isNotEmpty) {
      emit(AuthConfirmationState.initial(error: errServerInfo.toString()));
      return;
    }

    JWT jwtToken;
    try {
      jwtToken = JWT.verify(responseConfirmation.accessToken, ECPublicKey(responseServerInfo.publicKey));
    } on JWTException catch (ex) {
      logger.error(ex.toString());
      emit(AuthConfirmationState.initial(error: "signatureVerificationError", loading: false));
      return;
    }

    Users user = Users(
        expirationTime: jwtToken.payload['exp'],
        email: jwtToken.payload['email'],
        userId: jwtToken.payload['user_id'],
        accessToken: responseConfirmation.accessToken,
        refreshToken: responseConfirmation.refreshToken,
    );
    usersDB.createOrUpdate(user: user);

    return;
  }

}
