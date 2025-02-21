//
//  Generated code. Do not modify.
//  source: protos/streaming.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'streaming.pbenum.dart';

export 'streaming.pbenum.dart';

/// Info response
class StreamingEventsResponse extends $pb.GeneratedMessage {
  factory StreamingEventsResponse({
    StreamingEventsResponse_Type? type,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    return $result;
  }
  StreamingEventsResponse._() : super();
  factory StreamingEventsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamingEventsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StreamingEventsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'Api'), createEmptyInstance: create)
    ..e<StreamingEventsResponse_Type>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: StreamingEventsResponse_Type.healthcheck, valueOf: StreamingEventsResponse_Type.valueOf, enumValues: StreamingEventsResponse_Type.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamingEventsResponse clone() => StreamingEventsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamingEventsResponse copyWith(void Function(StreamingEventsResponse) updates) => super.copyWith((message) => updates(message as StreamingEventsResponse)) as StreamingEventsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamingEventsResponse create() => StreamingEventsResponse._();
  StreamingEventsResponse createEmptyInstance() => create();
  static $pb.PbList<StreamingEventsResponse> createRepeated() => $pb.PbList<StreamingEventsResponse>();
  @$core.pragma('dart2js:noInline')
  static StreamingEventsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamingEventsResponse>(create);
  static StreamingEventsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  StreamingEventsResponse_Type get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(StreamingEventsResponse_Type v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
