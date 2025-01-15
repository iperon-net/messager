import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../api/api.dart';
import '../injection.dart';
import '../logger.dart';
import '../utils.dart';

part 'auth_confirmation_state.dart';
part 'auth_confirmation_cubit.freezed.dart';

@injectable
class AuthConfirmationCubit extends Cubit<AuthConfirmationState> {
  AuthConfirmationCubit() : super(const AuthConfirmationState.initial());

  final textControllerEmail = TextEditingController();
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
      TextEditingController textControllerEmail,
  ) async {
    if (!formKeyAuth.currentState!.validate()) return;

    if(!utils.isDebug) textControllerEmail.clear();

    API api = getIt.get<API>();

    return;
  }

}
