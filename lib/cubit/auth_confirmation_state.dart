part of 'auth_confirmation_cubit.dart';

@freezed
class AuthConfirmationState with _$AuthConfirmationState {

  const factory AuthConfirmationState.initial({
    @Default(false) bool loading,
    @Default("") String error,
  }) = _Initial;

}
