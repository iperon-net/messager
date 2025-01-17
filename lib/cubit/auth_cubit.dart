import 'package:bloc/bloc.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger/injection.dart';
import 'package:messenger/protobuf/protos/models.pb.dart';
import 'package:messenger/protobuf/protos/server.pb.dart';
import 'package:messenger/utils.dart';

import '../api/api.dart';
import '../logger.dart';
import '../protobuf/protos/auth.pb.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial());

  final textControllerEmail = TextEditingController();
  final logger = getIt.get<Logger>();
  final utils = getIt.get<Utils>();

  String? validationEmail(BuildContext context, String? value) {
    if (value == null || value.isEmpty) return context.tr('enterValidEmail');

    value = value.replaceAll(' ', '').toLowerCase();
    final bool isValid = EmailValidator.validate(value);
    if (!isValid) return context.tr('invalidEmailAddress');

    return null;
  }

  Future<void> validator(
      BuildContext context,
      GlobalKey<FormState> formKeyAuth,
      TextEditingController textControllerEmail,
    ) async {

    if (!formKeyAuth.currentState!.validate()) return;

    if(!utils.isDebug) textControllerEmail.clear();

    //
    API api = getIt.get<API>();

    emit(AuthState.initial(loading: true));

    // createByEmail
    AuthCreateByEmailResponse responseAuthCreateByEmail = AuthCreateByEmailResponse();

    String err = await api.call(() async {
      responseAuthCreateByEmail = await api.authClient.createByEmail(
        AuthCreateByEmailRequest(email: textControllerEmail.text),
      );
    });

    if (err.isNotEmpty) {
      emit(AuthState.initial(error: err));
      return;
    }

    // Server info
    ServerInfoResponse responseServerInfo = ServerInfoResponse();
    String errServerInfo = await api.call(() async {
      responseServerInfo = await api.serverClient.info(EmptyRequest());
    });

    if (errServerInfo.isNotEmpty) {
      emit(AuthState.initial(error: errServerInfo.toString()));
      return;
    }

    try {
      JWT.verify(responseAuthCreateByEmail.signInToken, ECPublicKey(responseServerInfo.publicKey));
    } on JWTException catch (ex) {
      logger.error(ex.toString());
      emit(AuthState.initial(error: "signatureVerificationError", loading: false));
      return;
    }

    emit(AuthState.initial(signInToken: responseAuthCreateByEmail.signInToken, loading: false));
  }

}
