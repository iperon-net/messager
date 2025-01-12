part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState.initial({
    @Default(false) bool loading,
    @Default("") String error,
  }) = _Initial;

}
