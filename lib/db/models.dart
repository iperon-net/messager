import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class Users with _$Users {
  const factory Users({

    @JsonKey(name: 'user_id')
    required String userId,

    @JsonKey(name: 'email')
    required String email,

    @JsonKey(name: 'access_token')
    required String accessToken,

    @JsonKey(name: 'refresh_token')
    required String refreshToken,

    @JsonKey(name: 'expiration_time')
    required int expirationTime,

  }) = _Users;

  factory Users.fromJson(Map<String, Object?> json) => _$UsersFromJson(json);
}
