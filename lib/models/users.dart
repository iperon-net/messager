import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'converters.dart';

part 'users.freezed.dart';
part 'users.g.dart';

@freezed
class User with _$User {
  const User._();

  @JsonSerializable(
    explicitToJson: true,
  )
  const factory User({
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'username') @Default('') String username,
    @JsonKey(name: 'session') required String session,
    @ConverterBoolToInt() @JsonKey(name: 'is_active') @Default(false) bool isActive,
    @JsonKey(name: 'crypto_key') @Default("") String cryptoKey,

    // @JsonKey(name: 'profile')
    // @Default("") Profile profile,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
