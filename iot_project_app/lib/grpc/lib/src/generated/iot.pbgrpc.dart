///
//  Generated code. Do not modify.
//  source: iot.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'iot.pb.dart' as $0;
export 'iot.pb.dart';

class IoTClient extends $grpc.Client {
  static final _$serverStreamingMethod =
      $grpc.ClientMethod<$0.Request, $0.Response>(
          '/grpc_test.IoT/ServerStreamingMethod',
          ($0.Request value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));

  IoTClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.Response> serverStreamingMethod($0.Request request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$serverStreamingMethod, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class IoTServiceBase extends $grpc.Service {
  $core.String get $name => 'grpc_test.IoT';

  IoTServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Request, $0.Response>(
        'ServerStreamingMethod',
        serverStreamingMethod_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Request.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
  }

  $async.Stream<$0.Response> serverStreamingMethod_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Request> request) async* {
    yield* serverStreamingMethod(call, await request);
  }

  $async.Stream<$0.Response> serverStreamingMethod(
      $grpc.ServiceCall call, $0.Request request);
}
