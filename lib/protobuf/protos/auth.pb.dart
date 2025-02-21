//
//  Generated code. Do not modify.
//  source: protos/auth.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// CreateByEmail Request
class AuthCreateByEmailRequest extends $pb.GeneratedMessage {
  factory AuthCreateByEmailRequest({
    $core.String? email,
  }) {
    final $result = create();
    if (email != null) {
      $result.email = email;
    }
    return $result;
  }
  AuthCreateByEmailRequest._() : super();
  factory AuthCreateByEmailRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuthCreateByEmailRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AuthCreateByEmailRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuthCreateByEmailRequest clone() => AuthCreateByEmailRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuthCreateByEmailRequest copyWith(void Function(AuthCreateByEmailRequest) updates) =>
      super.copyWith((message) => updates(message as AuthCreateByEmailRequest)) as AuthCreateByEmailRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthCreateByEmailRequest create() => AuthCreateByEmailRequest._();
  AuthCreateByEmailRequest createEmptyInstance() => create();
  static $pb.PbList<AuthCreateByEmailRequest> createRepeated() => $pb.PbList<AuthCreateByEmailRequest>();
  @$core.pragma('dart2js:noInline')
  static AuthCreateByEmailRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthCreateByEmailRequest>(create);
  static AuthCreateByEmailRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);
}

/// CreateByEmail Response
class AuthCreateByEmailResponse extends $pb.GeneratedMessage {
  factory AuthCreateByEmailResponse({
    $core.String? signInToken,
    $core.String? email,
  }) {
    final $result = create();
    if (signInToken != null) {
      $result.signInToken = signInToken;
    }
    if (email != null) {
      $result.email = email;
    }
    return $result;
  }
  AuthCreateByEmailResponse._() : super();
  factory AuthCreateByEmailResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuthCreateByEmailResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AuthCreateByEmailResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'signInToken')
    ..aOS(2, _omitFieldNames ? '' : 'email')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuthCreateByEmailResponse clone() => AuthCreateByEmailResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuthCreateByEmailResponse copyWith(void Function(AuthCreateByEmailResponse) updates) =>
      super.copyWith((message) => updates(message as AuthCreateByEmailResponse)) as AuthCreateByEmailResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthCreateByEmailResponse create() => AuthCreateByEmailResponse._();
  AuthCreateByEmailResponse createEmptyInstance() => create();
  static $pb.PbList<AuthCreateByEmailResponse> createRepeated() => $pb.PbList<AuthCreateByEmailResponse>();
  @$core.pragma('dart2js:noInline')
  static AuthCreateByEmailResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthCreateByEmailResponse>(create);
  static AuthCreateByEmailResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get signInToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set signInToken($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSignInToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignInToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);
}

/// Confirmation Request
class AuthConfirmationRequest extends $pb.GeneratedMessage {
  factory AuthConfirmationRequest({
    $core.String? signInToken,
    $core.int? code,
    $core.List<$core.int>? exchangeKey,
  }) {
    final $result = create();
    if (signInToken != null) {
      $result.signInToken = signInToken;
    }
    if (code != null) {
      $result.code = code;
    }
    if (exchangeKey != null) {
      $result.exchangeKey = exchangeKey;
    }
    return $result;
  }
  AuthConfirmationRequest._() : super();
  factory AuthConfirmationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuthConfirmationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AuthConfirmationRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'signInToken')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'code', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'exchangeKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuthConfirmationRequest clone() => AuthConfirmationRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuthConfirmationRequest copyWith(void Function(AuthConfirmationRequest) updates) =>
      super.copyWith((message) => updates(message as AuthConfirmationRequest)) as AuthConfirmationRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthConfirmationRequest create() => AuthConfirmationRequest._();
  AuthConfirmationRequest createEmptyInstance() => create();
  static $pb.PbList<AuthConfirmationRequest> createRepeated() => $pb.PbList<AuthConfirmationRequest>();
  @$core.pragma('dart2js:noInline')
  static AuthConfirmationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthConfirmationRequest>(create);
  static AuthConfirmationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get signInToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set signInToken($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSignInToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignInToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get code => $_getIZ(1);
  @$pb.TagNumber(2)
  set code($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get exchangeKey => $_getN(2);
  @$pb.TagNumber(3)
  set exchangeKey($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasExchangeKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearExchangeKey() => clearField(3);
}

/// Confirmation Response
class AuthConfirmationResponse extends $pb.GeneratedMessage {
  factory AuthConfirmationResponse({
    $core.String? sessionToken,
    $core.String? email,
    $core.String? userId,
    $core.List<$core.int>? exchangeKey,
  }) {
    final $result = create();
    if (sessionToken != null) {
      $result.sessionToken = sessionToken;
    }
    if (email != null) {
      $result.email = email;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (exchangeKey != null) {
      $result.exchangeKey = exchangeKey;
    }
    return $result;
  }
  AuthConfirmationResponse._() : super();
  factory AuthConfirmationResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuthConfirmationResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AuthConfirmationResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'Api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sessionToken')
    ..aOS(2, _omitFieldNames ? '' : 'email')
    ..aOS(3, _omitFieldNames ? '' : 'userId')
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'exchangeKey', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuthConfirmationResponse clone() => AuthConfirmationResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuthConfirmationResponse copyWith(void Function(AuthConfirmationResponse) updates) =>
      super.copyWith((message) => updates(message as AuthConfirmationResponse)) as AuthConfirmationResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthConfirmationResponse create() => AuthConfirmationResponse._();
  AuthConfirmationResponse createEmptyInstance() => create();
  static $pb.PbList<AuthConfirmationResponse> createRepeated() => $pb.PbList<AuthConfirmationResponse>();
  @$core.pragma('dart2js:noInline')
  static AuthConfirmationResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthConfirmationResponse>(create);
  static AuthConfirmationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionToken($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSessionToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get exchangeKey => $_getN(3);
  @$pb.TagNumber(4)
  set exchangeKey($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasExchangeKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearExchangeKey() => clearField(4);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
