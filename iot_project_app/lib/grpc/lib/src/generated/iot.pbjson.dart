///
//  Generated code. Do not modify.
//  source: iot.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use requestDescriptor instead')
const Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'request_data', '3': 2, '4': 1, '5': 9, '10': 'requestData'},
  ],
};

/// Descriptor for `Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestDescriptor = $convert.base64Decode('CgdSZXF1ZXN0EiEKDHJlcXVlc3RfZGF0YRgCIAEoCVILcmVxdWVzdERhdGE=');
@$core.Deprecated('Use responseDataDescriptor instead')
const ResponseData$json = const {
  '1': 'ResponseData',
  '2': const [
    const {'1': 'moisture', '3': 1, '4': 1, '5': 3, '10': 'moisture'},
  ],
};

/// Descriptor for `ResponseData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseDataDescriptor = $convert.base64Decode('CgxSZXNwb25zZURhdGESGgoIbW9pc3R1cmUYASABKANSCG1vaXN0dXJl');
@$core.Deprecated('Use responseDescriptor instead')
const Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'ResponseData', '3': 2, '4': 1, '5': 11, '6': '.grpc_test.ResponseData', '10': 'ResponseData'},
  ],
};

/// Descriptor for `Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseDescriptor = $convert.base64Decode('CghSZXNwb25zZRI7CgxSZXNwb25zZURhdGEYAiABKAsyFy5ncnBjX3Rlc3QuUmVzcG9uc2VEYXRhUgxSZXNwb25zZURhdGE=');
