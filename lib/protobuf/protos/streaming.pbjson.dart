//
//  Generated code. Do not modify.
//  source: protos/streaming.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use streamingEventsResponseDescriptor instead')
const StreamingEventsResponse$json = {
  '1': 'StreamingEventsResponse',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.Api.StreamingEventsResponse.Type', '10': 'type'},
  ],
  '4': [StreamingEventsResponse_Type$json],
};

@$core.Deprecated('Use streamingEventsResponseDescriptor instead')
const StreamingEventsResponse_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'healthcheck', '2': 0},
  ],
};

/// Descriptor for `StreamingEventsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamingEventsResponseDescriptor =
    $convert.base64Decode('ChdTdHJlYW1pbmdFdmVudHNSZXNwb25zZRI1CgR0eXBlGAEgASgOMiEuQXBpLlN0cmVhbWluZ0'
        'V2ZW50c1Jlc3BvbnNlLlR5cGVSBHR5cGUiFwoEVHlwZRIPCgtoZWFsdGhjaGVjaxAA');
