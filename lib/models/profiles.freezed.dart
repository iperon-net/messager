// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profiles.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {

@JsonKey(name: 'first_name') String get firstName => throw _privateConstructorUsedError;@JsonKey(name: 'last_name') String get lastName => throw _privateConstructorUsedError;@JsonKey(name: 'about') String get about => throw _privateConstructorUsedError;@JsonKey(name: 'date_birth') DateTime? get dateBirth => throw _privateConstructorUsedError;
@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'about')  String about, @JsonKey(name: 'date_birth')  DateTime? dateBirth)  $default,) => throw _privateConstructorUsedError;

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'about')  String about, @JsonKey(name: 'date_birth')  DateTime? dateBirth)?  $default,{required TResult orElse(),}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Profile value)  $default,) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Profile value)?  $default,) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Profile value)?  $default,{required TResult orElse(),}) => throw _privateConstructorUsedError;
/// Serializes this Profile to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $ProfileCopyWith<$Res>  {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) = _$ProfileCopyWithImpl<$Res, Profile>;
@useResult
$Res call({
@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName,@JsonKey(name: 'about') String about,@JsonKey(name: 'date_birth') DateTime? dateBirth
});



}

/// @nodoc
class _$ProfileCopyWithImpl<$Res,$Val extends Profile> implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,Object? about = null,Object? dateBirth = freezed,}) {
  return _then(_value.copyWith(
firstName: null == firstName ? _value.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _value.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,about: null == about ? _value.about : about // ignore: cast_nullable_to_non_nullable
as String,dateBirth: freezed == dateBirth ? _value.dateBirth : dateBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,
  )as $Val);
}

}


/// @nodoc
abstract class _$$ProfileImplCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$ProfileImplCopyWith(_$ProfileImpl value, $Res Function(_$ProfileImpl) then) = __$$ProfileImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName,@JsonKey(name: 'about') String about,@JsonKey(name: 'date_birth') DateTime? dateBirth
});



}

/// @nodoc
class __$$ProfileImplCopyWithImpl<$Res> extends _$ProfileCopyWithImpl<$Res, _$ProfileImpl> implements _$$ProfileImplCopyWith<$Res> {
  __$$ProfileImplCopyWithImpl(_$ProfileImpl _value, $Res Function(_$ProfileImpl) _then)
      : super(_value, _then);


/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,Object? about = null,Object? dateBirth = freezed,}) {
  return _then(_$ProfileImpl(
firstName: null == firstName ? _value.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _value.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,about: null == about ? _value.about : about // ignore: cast_nullable_to_non_nullable
as String,dateBirth: freezed == dateBirth ? _value.dateBirth : dateBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ProfileImpl extends _Profile  {
  const _$ProfileImpl({@JsonKey(name: 'first_name') this.firstName = '', @JsonKey(name: 'last_name') this.lastName = '', @JsonKey(name: 'about') this.about = '', @JsonKey(name: 'date_birth') this.dateBirth}): super._();

  factory _$ProfileImpl.fromJson(Map<String, dynamic> json) => _$$ProfileImplFromJson(json);

@override@JsonKey(name: 'first_name') final  String firstName;
@override@JsonKey(name: 'last_name') final  String lastName;
@override@JsonKey(name: 'about') final  String about;
@override@JsonKey(name: 'date_birth') final  DateTime? dateBirth;

@override
String toString() {
  return 'Profile(firstName: $firstName, lastName: $lastName, about: $about, dateBirth: $dateBirth)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$ProfileImpl&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.about, about) || other.about == about)&&(identical(other.dateBirth, dateBirth) || other.dateBirth == dateBirth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,about,dateBirth);

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$ProfileImplCopyWith<_$ProfileImpl> get copyWith => __$$ProfileImplCopyWithImpl<_$ProfileImpl>(this, _$identity);

@override
@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'about')  String about, @JsonKey(name: 'date_birth')  DateTime? dateBirth)  $default,) {
  return $default(firstName,lastName,about,dateBirth);
}

@override
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName, @JsonKey(name: 'about')  String about, @JsonKey(name: 'date_birth')  DateTime? dateBirth)?  $default,{required TResult orElse(),}) {
  if ($default != null) {
    return $default(firstName,lastName,about,dateBirth);
  }
  return orElse();
}
@override
@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Profile value)  $default,) {
  return $default(this);
}
@override
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Profile value)?  $default,) {
  return $default?.call(this);
}
@override
@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Profile value)?  $default,{required TResult orElse(),}) {
  if ($default != null) {
    return $default(this);
  }
  return orElse();
}
@override
Map<String, dynamic> toJson() {
  return _$$ProfileImplToJson(this, );
}
}


abstract class _Profile extends Profile {
  const factory _Profile({@JsonKey(name: 'first_name') final  String firstName, @JsonKey(name: 'last_name') final  String lastName, @JsonKey(name: 'about') final  String about, @JsonKey(name: 'date_birth') final  DateTime? dateBirth}) = _$ProfileImpl;
  const _Profile._(): super._();

  factory _Profile.fromJson(Map<String, dynamic> json) = _$ProfileImpl.fromJson;

@override@JsonKey(name: 'first_name') String get firstName;@override@JsonKey(name: 'last_name') String get lastName;@override@JsonKey(name: 'about') String get about;@override@JsonKey(name: 'date_birth') DateTime? get dateBirth;
/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$ProfileImplCopyWith<_$ProfileImpl> get copyWith => throw _privateConstructorUsedError;

}
