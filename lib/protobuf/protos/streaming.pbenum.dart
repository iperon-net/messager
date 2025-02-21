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

class StreamingEventsResponse_Type extends $pb.ProtobufEnum {
  static const StreamingEventsResponse_Type healthcheck = StreamingEventsResponse_Type._(0, _omitEnumNames ? '' : 'healthcheck');

  static const $core.List<StreamingEventsResponse_Type> values = <StreamingEventsResponse_Type>[
    healthcheck,
  ];

  static final $core.Map<$core.int, StreamingEventsResponse_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static StreamingEventsResponse_Type? valueOf($core.int value) => _byValue[value];

  const StreamingEventsResponse_Type._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
