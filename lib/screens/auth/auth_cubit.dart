import 'package:bloc/bloc.dart';
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

  Future<void> validator(BuildContext context) async {
    if (!state.formKey.currentState!.validate()) return;

    logger.debug("validator");

    emit(state.copyWith(errorMessage: "", statusState: StatusState.loading));

    emit(state.copyWith(errorMessage: "", statusState: StatusState.success));

    alerts.show(context, title: "Error", message: "Test message");
    // context.read<AlertCubit>().setErrorMessage(context, "success");
  }
}
