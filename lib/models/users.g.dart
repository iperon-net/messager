// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      email: json['email'] as String,
      username: json['username'] as String? ?? '',
      session: json['session'] as String,
      isActive: json['is_active'] == null ? false : const ConverterBoolToInt().fromJson((json['is_active'] as num?)?.toInt()),
      cryptoKey: json['crypto_key'] as String? ?? "",
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) => <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'session': instance.session,
      'is_active': const ConverterBoolToInt().toJson(instance.isActive),
      'crypto_key': instance.cryptoKey,
    };
