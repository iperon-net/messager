import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users.freezed.dart';

@freezed
class User with _$User {
  const User._();

  const factory User({
    required String userId,
    required String email,
    required String sessionToken,
    required int isActive,
    required Uint8List sharedKey,
    required String server,

  }) = _User;

}
