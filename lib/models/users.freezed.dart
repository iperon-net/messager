// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$User {

 String get userId => throw _privateConstructorUsedError; String get email => throw _privateConstructorUsedError; String get sessionToken => throw _privateConstructorUsedError;@ConverterBoolToInt() int get isActive => throw _privateConstructorUsedError; Uint8List get sharedKey => throw _privateConstructorUsedError; String get server => throw _privateConstructorUsedError;
@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String email,  String sessionToken, @ConverterBoolToInt()  int isActive,  Uint8List sharedKey,  String server)  $default,) => throw _privateConstructorUsedError;

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String email,  String sessionToken, @ConverterBoolToInt()  int isActive,  Uint8List sharedKey,  String server)?  $default,{required TResult orElse(),}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}) => throw _privateConstructorUsedError;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) then) = _$UserCopyWithImpl<$Res, User>;
@useResult
$Res call({
 String userId, String email, String sessionToken,@ConverterBoolToInt() int isActive, Uint8List sharedKey, String server
});



}

/// @nodoc
class _$UserCopyWithImpl<$Res,$Val extends User> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? email = null,Object? sessionToken = null,Object? isActive = null,Object? sharedKey = null,Object? server = null,}) {
  return _then(_value.copyWith(
userId: null == userId ? _value.userId : userId // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _value.email : email // ignore: cast_nullable_to_non_nullable
as String,sessionToken: null == sessionToken ? _value.sessionToken : sessionToken // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _value.isActive : isActive // ignore: cast_nullable_to_non_nullable
as int,sharedKey: null == sharedKey ? _value.sharedKey : sharedKey // ignore: cast_nullable_to_non_nullable
as Uint8List,server: null == server ? _value.server : server // ignore: cast_nullable_to_non_nullable
as String,
  )as $Val);
}

}


/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(_$UserImpl value, $Res Function(_$UserImpl) then) = __$$UserImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String userId, String email, String sessionToken,@ConverterBoolToInt() int isActive, Uint8List sharedKey, String server
});



}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$UserImpl> implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);


/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? email = null,Object? sessionToken = null,Object? isActive = null,Object? sharedKey = null,Object? server = null,}) {
  return _then(_$UserImpl(
userId: null == userId ? _value.userId : userId // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _value.email : email // ignore: cast_nullable_to_non_nullable
as String,sessionToken: null == sessionToken ? _value.sessionToken : sessionToken // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _value.isActive : isActive // ignore: cast_nullable_to_non_nullable
as int,sharedKey: null == sharedKey ? _value.sharedKey : sharedKey // ignore: cast_nullable_to_non_nullable
as Uint8List,server: null == server ? _value.server : server // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _$UserImpl extends _User  with DiagnosticableTreeMixin {
  const _$UserImpl({required this.userId, required this.email, required this.sessionToken, @ConverterBoolToInt() required this.isActive, required this.sharedKey, required this.server}): super._();

  

@override final  String userId;
@override final  String email;
@override final  String sessionToken;
@override@ConverterBoolToInt() final  int isActive;
@override final  Uint8List sharedKey;
@override final  String server;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'User(userId: $userId, email: $email, sessionToken: $sessionToken, isActive: $isActive, sharedKey: $sharedKey, server: $server)';
}

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  super.debugFillProperties(properties);
  properties
    ..add(DiagnosticsProperty('type', 'User'))
    ..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('email', email))..add(DiagnosticsProperty('sessionToken', sessionToken))..add(DiagnosticsProperty('isActive', isActive))..add(DiagnosticsProperty('sharedKey', sharedKey))..add(DiagnosticsProperty('server', server));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$UserImpl&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.sessionToken, sessionToken) || other.sessionToken == sessionToken)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other.sharedKey, sharedKey)&&(identical(other.server, server) || other.server == server));
}


@override
int get hashCode => Object.hash(runtimeType,userId,email,sessionToken,isActive,const DeepCollectionEquality().hash(sharedKey),server);

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$UserImplCopyWith<_$UserImpl> get copyWith => __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

@override
@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String email,  String sessionToken, @ConverterBoolToInt()  int isActive,  Uint8List sharedKey,  String server)  $default,) {
  return $default(userId,email,sessionToken,isActive,sharedKey,server);
}

@override
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String email,  String sessionToken, @ConverterBoolToInt()  int isActive,  Uint8List sharedKey,  String server)?  $default,{required TResult orElse(),}) {
  if ($default != null) {
    return $default(userId,email,sessionToken,isActive,sharedKey,server);
  }
  return orElse();
}
@override
@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,) {
  return $default(this);
}
@override
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,) {
  return $default?.call(this);
}
@override
@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}) {
  if ($default != null) {
    return $default(this);
  }
  return orElse();
}

}


abstract class _User extends User {
  const factory _User({required final  String userId, required final  String email, required final  String sessionToken, @ConverterBoolToInt() required final  int isActive, required final  Uint8List sharedKey, required final  String server}) = _$UserImpl;
  const _User._(): super._();

  

@override String get userId;@override String get email;@override String get sessionToken;@override@ConverterBoolToInt() int get isActive;@override Uint8List get sharedKey;@override String get server;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$UserImplCopyWith<_$UserImpl> get copyWith => throw _privateConstructorUsedError;

}
