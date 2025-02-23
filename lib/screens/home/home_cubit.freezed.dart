// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {

 StatusState get statusState => throw _privateConstructorUsedError;
@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StatusState statusState)  $default,) => throw _privateConstructorUsedError;

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StatusState statusState)?  $default,{required TResult orElse(),}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Initial value)  $default,) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Initial value)?  $default,) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Initial value)?  $default,{required TResult orElse(),}) => throw _privateConstructorUsedError;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$HomeStateCopyWith<HomeState> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) = _$HomeStateCopyWithImpl<$Res, HomeState>;
@useResult
$Res call({
 StatusState statusState
});



}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res,$Val extends HomeState> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusState = null,}) {
  return _then(_value.copyWith(
statusState: null == statusState ? _value.statusState : statusState // ignore: cast_nullable_to_non_nullable
as StatusState,
  )as $Val);
}

}


/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(_$InitialImpl value, $Res Function(_$InitialImpl) then) = __$$InitialImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 StatusState statusState
});



}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl> implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(_$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusState = null,}) {
  return _then(_$InitialImpl(
statusState: null == statusState ? _value.statusState : statusState // ignore: cast_nullable_to_non_nullable
as StatusState,
  ));
}


}

/// @nodoc


class _$InitialImpl  implements _Initial {
  const _$InitialImpl({this.statusState = StatusState.initial});

  

@override@JsonKey() final  StatusState statusState;

@override
String toString() {
  return 'HomeState(statusState: $statusState)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$InitialImpl&&(identical(other.statusState, statusState) || other.statusState == statusState));
}


@override
int get hashCode => Object.hash(runtimeType,statusState);

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$InitialImplCopyWith<_$InitialImpl> get copyWith => __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

@override
@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StatusState statusState)  $default,) {
  return $default(statusState);
}

@override
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StatusState statusState)?  $default,{required TResult orElse(),}) {
  if ($default != null) {
    return $default(statusState);
  }
  return orElse();
}
@override
@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Initial value)  $default,) {
  return $default(this);
}
@override
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Initial value)?  $default,) {
  return $default?.call(this);
}
@override
@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Initial value)?  $default,{required TResult orElse(),}) {
  if ($default != null) {
    return $default(this);
  }
  return orElse();
}

}


abstract class _Initial implements HomeState {
  const factory _Initial({final  StatusState statusState}) = _$InitialImpl;
  

  

@override StatusState get statusState;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$InitialImplCopyWith<_$InitialImpl> get copyWith => throw _privateConstructorUsedError;

}
