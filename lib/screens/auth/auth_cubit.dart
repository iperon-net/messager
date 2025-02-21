import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:messenger/constants.dart';

import '../../contrib/alerts.dart';
import '../../contrib/di.dart';
import '../../contrib/logger.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final logger = getIt.get<Logger>();
  final alerts = getIt.get<Alerts>();

  AuthCubit()
      : super(
          AuthState(
            formKey: GlobalKey<FormState>(),
            textControllerEmail: TextEditingController(),
            focusNodeEmail: FocusNode(),
          ),
        );

  // Validator email
  String? validatorEmail(BuildContext context, String? value) {
    if (value == null || value.isEmpty) return context.tr('enterValidEmail');

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

    if (context.mounted) alerts.show(context, title: "Error", message: "Test message");
  }
}
