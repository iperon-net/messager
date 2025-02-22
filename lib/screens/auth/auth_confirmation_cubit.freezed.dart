// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_confirmation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthConfirmationState {

 GlobalKey<FormState> get formKey => throw _privateConstructorUsedError; TextEditingController get textControllerCode => throw _privateConstructorUsedError; FocusNode get focusNodeCode => throw _privateConstructorUsedError; StatusState get statusState => throw _privateConstructorUsedError;
@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GlobalKey<FormState> formKey,  TextEditingController textControllerCode,  FocusNode focusNodeCode,  StatusState statusState)  $default,) => throw _privateConstructorUsedError;

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GlobalKey<FormState> formKey,  TextEditingController textControllerCode,  FocusNode focusNodeCode,  StatusState statusState)?  $default,{required TResult orElse(),}) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Initial value)  $default,) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Initial value)?  $default,) => throw _privateConstructorUsedError;
@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Initial value)?  $default,{required TResult orElse(),}) => throw _privateConstructorUsedError;

/// Create a copy of AuthConfirmationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$AuthConfirmationStateCopyWith<AuthConfirmationState> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $AuthConfirmationStateCopyWith<$Res>  {
  factory $AuthConfirmationStateCopyWith(AuthConfirmationState value, $Res Function(AuthConfirmationState) then) = _$AuthConfirmationStateCopyWithImpl<$Res, AuthConfirmationState>;
@useResult
$Res call({
 GlobalKey<FormState> formKey, TextEditingController textControllerCode, FocusNode focusNodeCode, StatusState statusState
});



}

/// @nodoc
class _$AuthConfirmationStateCopyWithImpl<$Res,$Val extends AuthConfirmationState> implements $AuthConfirmationStateCopyWith<$Res> {
  _$AuthConfirmationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of AuthConfirmationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? formKey = null,Object? textControllerCode = null,Object? focusNodeCode = null,Object? statusState = null,}) {
  return _then(_value.copyWith(
formKey: null == formKey ? _value.formKey : formKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<FormState>,textControllerCode: null == textControllerCode ? _value.textControllerCode : textControllerCode // ignore: cast_nullable_to_non_nullable
as TextEditingController,focusNodeCode: null == focusNodeCode ? _value.focusNodeCode : focusNodeCode // ignore: cast_nullable_to_non_nullable
as FocusNode,statusState: null == statusState ? _value.statusState : statusState // ignore: cast_nullable_to_non_nullable
as StatusState,
  )as $Val);
}

}


/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> implements $AuthConfirmationStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(_$InitialImpl value, $Res Function(_$InitialImpl) then) = __$$InitialImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 GlobalKey<FormState> formKey, TextEditingController textControllerCode, FocusNode focusNodeCode, StatusState statusState
});



}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res> extends _$AuthConfirmationStateCopyWithImpl<$Res, _$InitialImpl> implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(_$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);


/// Create a copy of AuthConfirmationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? formKey = null,Object? textControllerCode = null,Object? focusNodeCode = null,Object? statusState = null,}) {
  return _then(_$InitialImpl(
formKey: null == formKey ? _value.formKey : formKey // ignore: cast_nullable_to_non_nullable
as GlobalKey<FormState>,textControllerCode: null == textControllerCode ? _value.textControllerCode : textControllerCode // ignore: cast_nullable_to_non_nullable
as TextEditingController,focusNodeCode: null == focusNodeCode ? _value.focusNodeCode : focusNodeCode // ignore: cast_nullable_to_non_nullable
as FocusNode,statusState: null == statusState ? _value.statusState : statusState // ignore: cast_nullable_to_non_nullable
as StatusState,
  ));
}


}

/// @nodoc


class _$InitialImpl  implements _Initial {
  const _$InitialImpl({required this.formKey, required this.textControllerCode, required this.focusNodeCode, this.statusState = StatusState.initial});

  

@override final  GlobalKey<FormState> formKey;
@override final  TextEditingController textControllerCode;
@override final  FocusNode focusNodeCode;
@override@JsonKey() final  StatusState statusState;

@override
String toString() {
  return 'AuthConfirmationState(formKey: $formKey, textControllerCode: $textControllerCode, focusNodeCode: $focusNodeCode, statusState: $statusState)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$InitialImpl&&(identical(other.formKey, formKey) || other.formKey == formKey)&&(identical(other.textControllerCode, textControllerCode) || other.textControllerCode == textControllerCode)&&(identical(other.focusNodeCode, focusNodeCode) || other.focusNodeCode == focusNodeCode)&&(identical(other.statusState, statusState) || other.statusState == statusState));
}


@override
int get hashCode => Object.hash(runtimeType,formKey,textControllerCode,focusNodeCode,statusState);

/// Create a copy of AuthConfirmationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$InitialImplCopyWith<_$InitialImpl> get copyWith => __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

@override
@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GlobalKey<FormState> formKey,  TextEditingController textControllerCode,  FocusNode focusNodeCode,  StatusState statusState)  $default,) {
  return $default(formKey,textControllerCode,focusNodeCode,statusState);
}

@override
@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GlobalKey<FormState> formKey,  TextEditingController textControllerCode,  FocusNode focusNodeCode,  StatusState statusState)?  $default,{required TResult orElse(),}) {
  if ($default != null) {
    return $default(formKey,textControllerCode,focusNodeCode,statusState);
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


abstract class _Initial implements AuthConfirmationState {
  const factory _Initial({required final  GlobalKey<FormState> formKey, required final  TextEditingController textControllerCode, required final  FocusNode focusNodeCode, final  StatusState statusState}) = _$InitialImpl;
  

  

@override GlobalKey<FormState> get formKey;@override TextEditingController get textControllerCode;@override FocusNode get focusNodeCode;@override StatusState get statusState;
/// Create a copy of AuthConfirmationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$InitialImplCopyWith<_$InitialImpl> get copyWith => throw _privateConstructorUsedError;

}
