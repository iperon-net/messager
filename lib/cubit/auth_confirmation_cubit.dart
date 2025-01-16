import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../analytics.dart';
import '../api/api.dart';
import '../injection.dart';
import '../logger.dart';
import '../protobuf/protos/auth.pb.dart';
import '../utils.dart';

part 'auth_confirmation_state.dart';
part 'auth_confirmation_cubit.freezed.dart';

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
  ) async {
    if (!formKeyAuth.currentState!.validate()) return;

    if(!utils.isDebug) textControllerCode.clear();

    API api = getIt.get<API>();

    // api.authClient.confirmation(request);
    final code = textControllerCode.text;

    Logger logger = getIt.get<Logger>();
    Analytics analytics = getIt.get<Analytics>();

    analytics.eventLogin("email");

    logger.debug(code.toString());

    AuthConfirmationResponse responseConfirmation = AuthConfirmationResponse();

    String errAuthConfirmation = await api.call(() async {
      // responseConfirmation = await api.authClient.confirmation(AuthConfirmationRequest(signInToken: "", code: code));
    });



    return;
  }

}
