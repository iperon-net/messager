import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger/injection.dart';
import 'package:messenger/utils.dart';

import '../logger.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial());

  final textControllerEmail = TextEditingController();
  final logger = getIt.get<Logger>();
  final utils = getIt.get<Utils>();

  String? validationEmail(BuildContext context, String? value) {
    if (value == null || value.isEmpty) return context.tr('enter_valid_email');

    value = value.replaceAll(' ', '').toLowerCase();
    final bool isValid = EmailValidator.validate(value);
    if (!isValid) return context.tr('invalid_email_address');

    return null;
  }

  Future<void> validator(
      BuildContext context,
      GlobalKey<FormState> formKeyAuth,
      TextEditingController textControllerEmail,
    ) async {

    if (!formKeyAuth.currentState!.validate()) return;
    logger.debug(textControllerEmail.text.toString());

    if(!utils.isDebug) textControllerEmail.clear();

  }

}
