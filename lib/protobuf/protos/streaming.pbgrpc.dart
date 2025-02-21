//
//  Generated code. Do not modify.
//  source: protos/streaming.proto
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
import 'streaming.pb.dart' as $3;

export 'streaming.pb.dart';

@$pb.GrpcServiceName('Api.Streaming')
class StreamingClient extends $grpc.Client {
  static final _$events = $grpc.ClientMethod<$1.EmptyRequest, $3.StreamingEventsResponse>('/Api.Streaming/Events',
      ($1.EmptyRequest value) => value.writeToBuffer(), ($core.List<$core.int> value) => $3.StreamingEventsResponse.fromBuffer(value));

  StreamingClient($grpc.ClientChannel channel, {$grpc.CallOptions? options, $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$3.StreamingEventsResponse> events($1.EmptyRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$events, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('Api.Streaming')
abstract class StreamingServiceBase extends $grpc.Service {
  $core.String get $name => 'Api.Streaming';

  StreamingServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.EmptyRequest, $3.StreamingEventsResponse>('Events', events_Pre, false, true,
        ($core.List<$core.int> value) => $1.EmptyRequest.fromBuffer(value), ($3.StreamingEventsResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$3.StreamingEventsResponse> events_Pre($grpc.ServiceCall call, $async.Future<$1.EmptyRequest> request) async* {
    yield* events(call, await request);
  }

  $async.Stream<$3.StreamingEventsResponse> events($grpc.ServiceCall call, $1.EmptyRequest request);
}
