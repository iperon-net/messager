//
//  Generated code. Do not modify.
//  source: protos/auth.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'auth.pb.dart' as $0;

export 'auth.pb.dart';

@$pb.GrpcServiceName('Api.Auth')
class AuthClient extends $grpc.Client {
  static final _$createByEmail = $grpc.ClientMethod<$0.AuthCreateByEmailRequest, $0.AuthCreateByEmailResponse>(
      '/Api.Auth/CreateByEmail',
      ($0.AuthCreateByEmailRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AuthCreateByEmailResponse.fromBuffer(value));
  static final _$confirmation = $grpc.ClientMethod<$0.AuthConfirmationRequest, $0.AuthConfirmationResponse>(
      '/Api.Auth/Confirmation',
      ($0.AuthConfirmationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AuthConfirmationResponse.fromBuffer(value));

  AuthClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.AuthCreateByEmailResponse> createByEmail($0.AuthCreateByEmailRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createByEmail, request, options: options);
  }

  $grpc.ResponseFuture<$0.AuthConfirmationResponse> confirmation($0.AuthConfirmationRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$confirmation, request, options: options);
  }
}

@$pb.GrpcServiceName('Api.Auth')
abstract class AuthServiceBase extends $grpc.Service {
  $core.String get $name => 'Api.Auth';

  AuthServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AuthCreateByEmailRequest, $0.AuthCreateByEmailResponse>(
        'CreateByEmail',
        createByEmail_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AuthCreateByEmailRequest.fromBuffer(value),
        ($0.AuthCreateByEmailResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AuthConfirmationRequest, $0.AuthConfirmationResponse>(
        'Confirmation',
        confirmation_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AuthConfirmationRequest.fromBuffer(value),
        ($0.AuthConfirmationResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.AuthCreateByEmailResponse> createByEmail_Pre($grpc.ServiceCall call, $async.Future<$0.AuthCreateByEmailRequest> request) async {
    return createByEmail(call, await request);
  }

  $async.Future<$0.AuthConfirmationResponse> confirmation_Pre($grpc.ServiceCall call, $async.Future<$0.AuthConfirmationRequest> request) async {
    return confirmation(call, await request);
  }

  $async.Future<$0.AuthCreateByEmailResponse> createByEmail($grpc.ServiceCall call, $0.AuthCreateByEmailRequest request);
  $async.Future<$0.AuthConfirmationResponse> confirmation($grpc.ServiceCall call, $0.AuthConfirmationRequest request);
}
