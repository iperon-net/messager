//
//  Generated code. Do not modify.
//  source: protos/server.proto
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

import 'models.pb.dart' as $1;
import 'server.pb.dart' as $2;

export 'server.pb.dart';

@$pb.GrpcServiceName('Api.Server')
class ServerClient extends $grpc.Client {
  static final _$info = $grpc.ClientMethod<$1.EmptyRequest, $2.ServerInfoResponse>(
      '/Api.Server/Info',
      ($1.EmptyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.ServerInfoResponse.fromBuffer(value));

  ServerClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$2.ServerInfoResponse> info($1.EmptyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$info, request, options: options);
  }
}

@$pb.GrpcServiceName('Api.Server')
abstract class ServerServiceBase extends $grpc.Service {
  $core.String get $name => 'Api.Server';

  ServerServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.EmptyRequest, $2.ServerInfoResponse>(
        'Info',
        info_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.EmptyRequest.fromBuffer(value),
        ($2.ServerInfoResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.ServerInfoResponse> info_Pre($grpc.ServiceCall call, $async.Future<$1.EmptyRequest> request) async {
    return info(call, await request);
  }

  $async.Future<$2.ServerInfoResponse> info($grpc.ServiceCall call, $1.EmptyRequest request);
}
