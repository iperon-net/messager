// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profiles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) => _$ProfileImpl(
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      about: json['about'] as String? ?? '',
      dateBirth: json['date_birth'] == null ? null : DateTime.parse(json['date_birth'] as String),
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) => <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'about': instance.about,
      'date_birth': instance.dateBirth?.toIso8601String(),
    };
