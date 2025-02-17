// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {

 String get errorMessage => throw _privateConstructorUsedError;
@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String errorMessage)  $default,) => throw _privateConstructorUsedError;

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String errorMessage)?  $default,{required TResult orElse(),}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthState value)  $default,) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthState value)?  $default,) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthState value)?  $default,{required TResult orElse(),}) => throw _privateConstructorUsedError;


}









/// @nodoc


class _$AuthStateImpl  implements _AuthState {
  const _$AuthStateImpl({this.errorMessage = ""});

  

@override@JsonKey() final  String errorMessage;

@override
String toString() {
  return 'AuthState(errorMessage: $errorMessage)';
}





@override
@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String errorMessage)  $default,) {
  return $default(errorMessage);
}

@override
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String errorMessage)?  $default,{required TResult orElse(),}) {
  if ($default != null) {
    return $default(errorMessage);
  }
  return orElse();
}
@override
@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthState value)  $default,) {
  return $default(this);
}
@override
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthState value)?  $default,) {
  return $default?.call(this);
}
@override
@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthState value)?  $default,{required TResult orElse(),}) {
  if ($default != null) {
    return $default(this);
  }
  return orElse();
}

}


abstract class _AuthState implements AuthState {
  const factory _AuthState({final  String errorMessage}) = _$AuthStateImpl;
  

  

@override String get errorMessage;

}
