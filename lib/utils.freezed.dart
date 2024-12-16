// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'utils.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PackageInformation {
  String get version => throw _privateConstructorUsedError;
  String get buildNumber => throw _privateConstructorUsedError;
  String get buildSignature => throw _privateConstructorUsedError;
  String get appName => throw _privateConstructorUsedError;
  String get packageName => throw _privateConstructorUsedError;

  /// Create a copy of PackageInformation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackageInformationCopyWith<PackageInformation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageInformationCopyWith<$Res> {
  factory $PackageInformationCopyWith(
          PackageInformation value, $Res Function(PackageInformation) then) =
      _$PackageInformationCopyWithImpl<$Res, PackageInformation>;
  @useResult
  $Res call(
      {String version,
      String buildNumber,
      String buildSignature,
      String appName,
      String packageName});
}

/// @nodoc
class _$PackageInformationCopyWithImpl<$Res, $Val extends PackageInformation>
    implements $PackageInformationCopyWith<$Res> {
  _$PackageInformationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PackageInformation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? buildNumber = null,
    Object? buildSignature = null,
    Object? appName = null,
    Object? packageName = null,
  }) {
    return _then(_value.copyWith(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      buildNumber: null == buildNumber
          ? _value.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as String,
      buildSignature: null == buildSignature
          ? _value.buildSignature
          : buildSignature // ignore: cast_nullable_to_non_nullable
              as String,
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      packageName: null == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PackageInformationImplCopyWith<$Res>
    implements $PackageInformationCopyWith<$Res> {
  factory _$$PackageInformationImplCopyWith(_$PackageInformationImpl value,
          $Res Function(_$PackageInformationImpl) then) =
      __$$PackageInformationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String version,
      String buildNumber,
      String buildSignature,
      String appName,
      String packageName});
}

/// @nodoc
class __$$PackageInformationImplCopyWithImpl<$Res>
    extends _$PackageInformationCopyWithImpl<$Res, _$PackageInformationImpl>
    implements _$$PackageInformationImplCopyWith<$Res> {
  __$$PackageInformationImplCopyWithImpl(_$PackageInformationImpl _value,
      $Res Function(_$PackageInformationImpl) _then)
      : super(_value, _then);

  /// Create a copy of PackageInformation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? buildNumber = null,
    Object? buildSignature = null,
    Object? appName = null,
    Object? packageName = null,
  }) {
    return _then(_$PackageInformationImpl(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      buildNumber: null == buildNumber
          ? _value.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as String,
      buildSignature: null == buildSignature
          ? _value.buildSignature
          : buildSignature // ignore: cast_nullable_to_non_nullable
              as String,
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      packageName: null == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PackageInformationImpl
    with DiagnosticableTreeMixin
    implements _PackageInformation {
  const _$PackageInformationImpl(
      {required this.version,
      required this.buildNumber,
      required this.buildSignature,
      required this.appName,
      required this.packageName});

  @override
  final String version;
  @override
  final String buildNumber;
  @override
  final String buildSignature;
  @override
  final String appName;
  @override
  final String packageName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PackageInformation(version: $version, buildNumber: $buildNumber, buildSignature: $buildSignature, appName: $appName, packageName: $packageName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PackageInformation'))
      ..add(DiagnosticsProperty('version', version))
      ..add(DiagnosticsProperty('buildNumber', buildNumber))
      ..add(DiagnosticsProperty('buildSignature', buildSignature))
      ..add(DiagnosticsProperty('appName', appName))
      ..add(DiagnosticsProperty('packageName', packageName));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackageInformationImpl &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.buildNumber, buildNumber) ||
                other.buildNumber == buildNumber) &&
            (identical(other.buildSignature, buildSignature) ||
                other.buildSignature == buildSignature) &&
            (identical(other.appName, appName) || other.appName == appName) &&
            (identical(other.packageName, packageName) ||
                other.packageName == packageName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, version, buildNumber, buildSignature, appName, packageName);

  /// Create a copy of PackageInformation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackageInformationImplCopyWith<_$PackageInformationImpl> get copyWith =>
      __$$PackageInformationImplCopyWithImpl<_$PackageInformationImpl>(
          this, _$identity);
}

abstract class _PackageInformation implements PackageInformation {
  const factory _PackageInformation(
      {required final String version,
      required final String buildNumber,
      required final String buildSignature,
      required final String appName,
      required final String packageName}) = _$PackageInformationImpl;

  @override
  String get version;
  @override
  String get buildNumber;
  @override
  String get buildSignature;
  @override
  String get appName;
  @override
  String get packageName;

  /// Create a copy of PackageInformation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackageInformationImplCopyWith<_$PackageInformationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
