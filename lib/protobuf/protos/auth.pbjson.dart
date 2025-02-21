//
//  Generated code. Do not modify.
//  source: protos/auth.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use authCreateByEmailRequestDescriptor instead')
const AuthCreateByEmailRequest$json = {
  '1': 'AuthCreateByEmailRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `AuthCreateByEmailRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authCreateByEmailRequestDescriptor = $convert.base64Decode(
    'ChhBdXRoQ3JlYXRlQnlFbWFpbFJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWls');

@$core.Deprecated('Use authCreateByEmailResponseDescriptor instead')
const AuthCreateByEmailResponse$json = {
  '1': 'AuthCreateByEmailResponse',
  '2': [
    {'1': 'sign_in_token', '3': 1, '4': 1, '5': 9, '10': 'signInToken'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `AuthCreateByEmailResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authCreateByEmailResponseDescriptor = $convert.base64Decode(
    'ChlBdXRoQ3JlYXRlQnlFbWFpbFJlc3BvbnNlEiIKDXNpZ25faW5fdG9rZW4YASABKAlSC3NpZ2'
    '5JblRva2VuEhQKBWVtYWlsGAIgASgJUgVlbWFpbA==');

@$core.Deprecated('Use authConfirmationRequestDescriptor instead')
const AuthConfirmationRequest$json = {
  '1': 'AuthConfirmationRequest',
  '2': [
    {'1': 'sign_in_token', '3': 1, '4': 1, '5': 9, '10': 'signInToken'},
    {'1': 'code', '3': 2, '4': 1, '5': 5, '10': 'code'},
    {'1': 'exchange_key', '3': 3, '4': 1, '5': 12, '10': 'exchangeKey'},
  ],
};

/// Descriptor for `AuthConfirmationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authConfirmationRequestDescriptor = $convert.base64Decode(
    'ChdBdXRoQ29uZmlybWF0aW9uUmVxdWVzdBIiCg1zaWduX2luX3Rva2VuGAEgASgJUgtzaWduSW'
    '5Ub2tlbhISCgRjb2RlGAIgASgFUgRjb2RlEiEKDGV4Y2hhbmdlX2tleRgDIAEoDFILZXhjaGFu'
    'Z2VLZXk=');

@$core.Deprecated('Use authConfirmationResponseDescriptor instead')
const AuthConfirmationResponse$json = {
  '1': 'AuthConfirmationResponse',
  '2': [
    {'1': 'session_token', '3': 1, '4': 1, '5': 9, '10': 'sessionToken'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'user_id', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'exchange_key', '3': 4, '4': 1, '5': 12, '10': 'exchangeKey'},
  ],
};

/// Descriptor for `AuthConfirmationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authConfirmationResponseDescriptor = $convert.base64Decode(
    'ChhBdXRoQ29uZmlybWF0aW9uUmVzcG9uc2USIwoNc2Vzc2lvbl90b2tlbhgBIAEoCVIMc2Vzc2'
    'lvblRva2VuEhQKBWVtYWlsGAIgASgJUgVlbWFpbBIXCgd1c2VyX2lkGAMgASgJUgZ1c2VySWQS'
    'IQoMZXhjaGFuZ2Vfa2V5GAQgASgMUgtleGNoYW5nZUtleQ==');

