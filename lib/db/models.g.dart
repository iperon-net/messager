// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsersImpl _$$UsersImplFromJson(Map<String, dynamic> json) => _$UsersImpl(
      userId: json['user_id'] as String,
      email: json['email'] as String,
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      expirationTime: (json['expiration_time'] as num).toInt(),
    );

Map<String, dynamic> _$$UsersImplToJson(_$UsersImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'email': instance.email,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'expiration_time': instance.expirationTime,
    };
