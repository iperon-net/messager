import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

import '../../api/api.dart';
import '../../constants.dart';
import '../../contrib/alerts.dart';
import '../../contrib/di.dart';
import '../../contrib/logger.dart';
import '../../contrib/utils.dart';
import '../../exceptions.dart';
import '../../protobuf/protos/auth.pb.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final logger = getIt.get<Logger>();
  final alerts = getIt.get<Alerts>();
  final utils = getIt.get<Utils>();
  final api = getIt.get<API>();

  AuthCubit()
      : super(
          AuthState(
            formKey: GlobalKey<FormState>(),
            textControllerEmail: TextEditingController(),
            focusNodeEmail: FocusNode(),
          ),
        );

  Future<void> testException() async {
    throw BaseException("error system");
  }

  // OnTab
  void onTabEmail(BuildContext context) {
    if (utils.platform == SysPlatform.android) {
      ScaffoldMessenger.of(context).clearSnackBars();
    }
  }

  // Validator email
  String? validatorEmail(BuildContext context, String? value) {
    if (value == null || value.isEmpty) return context.tr('enterValidEmail');

    // utils.exception(() async {
    //   throw BaseException("eeeee");
    // }, context: context);

    value = value.replaceAll(' ', '').toLowerCase();
    final bool isValid = EmailValidator.validate(value);
    if (!isValid) return context.tr('invalidEmailAddress');
    return null;
  }

  Future<void> validator(BuildContext context) async {
    await alerts.reset(context);

    if (!state.formKey.currentState!.validate()) return;


    emit(state.copyWith(statusState: StatusState.loading));

    // Send to API
    late AuthCreateByEmailResponse createByEmailResponse;

    final resultExceptionGrpc = await utils.exceptionGrpc(() async {
      createByEmailResponse = await api.auth.createByEmail(state.textControllerEmail.text);
    });

    if (resultExceptionGrpc.error.isNotEmpty) {
      emit(state.copyWith(statusState: StatusState.error));
      if (context.mounted) alerts.show(context, Alert(context.tr("error"), context.tr(resultExceptionGrpc.error)));
      return;
    }

    emit(state.copyWith(statusState: StatusState.success));

    if(context.mounted) {
      context.goNamed(
          "authConfirmation",
          pathParameters: {
            "signInToken" : createByEmailResponse.signInToken,
          },
      );
      return;
    }

  }

}
