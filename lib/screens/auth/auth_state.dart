part of 'auth_cubit.dart';

@freezed
sealed class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState({
    required GlobalKey<FormState> formKey,
    required TextEditingController textControllerEmail,
    required FocusNode focusNodeEmail,
    @Default(StatusState.initial) StatusState statusState,
  }) = _Initial;
}
