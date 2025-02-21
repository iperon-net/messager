import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messenger/constants.dart';
import 'package:messenger/exceptions.dart';

import '../../contrib/alerts.dart';
import '../../contrib/di.dart';
import '../../contrib/logger.dart';
import '../../contrib/utils.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final logger = getIt.get<Logger>();
  final alerts = getIt.get<Alerts>();
  final utils = getIt.get<Utils>();

  AuthCubit()
      : super(
          AuthState(
            formKey: GlobalKey<FormState>(),
            textControllerEmail: TextEditingController(),
            focusNodeEmail: FocusNode(),
          ),
        );

  Future<void> testException() async {
    throw BaseException("eeeee");
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

    logger.debug("validator");

    emit(state.copyWith(statusState: StatusState.loading));

    emit(state.copyWith(statusState: StatusState.success));

    if (context.mounted) alerts.show(context, Alert("Error", "Системная ошибка"));

  }
}
