part of 'auth_confirmation_cubit.dart';

@freezed
class AuthConfirmationState with _$AuthConfirmationState {
  const factory AuthConfirmationState({
    required GlobalKey<FormState> formKey,
    required TextEditingController textControllerCode,
    required FocusNode focusNodeCode,
    @Default(StatusState.initial) StatusState statusState,
  }) = _Initial;

}
