import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../constants.dart';

part 'auth_confirmation_state.dart';
part 'auth_confirmation_cubit.freezed.dart';

class AuthConfirmationCubit extends Cubit<AuthConfirmationState> {
  AuthConfirmationCubit() : super(AuthConfirmationState(
    formKey: GlobalKey<FormState>(),
    textControllerCode: TextEditingController(),
    focusNodeCode: FocusNode(),
  ));

  // Validator code
  String? validatorCode(BuildContext context, String? value) {
    if (value == null || value.isEmpty) return context.tr('invalidConfirmationCode');

    final valueInt = int.parse(value);

    if (valueInt >= 100_000 && valueInt <= 999_999) return null;

    return context.tr('invalidConfirmationCode');
  }

  // Validator
  Future<void> validator(BuildContext context) async {
    if (!state.formKey.currentState!.validate()) return;
  }

}
