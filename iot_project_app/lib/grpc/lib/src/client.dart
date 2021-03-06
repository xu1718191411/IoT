import 'dart:convert';
import 'dart:io';

import 'package:grpc/grpc.dart';
import '../../../configs.dart';
import 'generated/iot.pbgrpc.dart';
import 'generated/iot.pb.dart';

Future<void> fetchMoisture(void Function(String v, bool ok) fn) async {
  final channel = ClientChannel(
    grpcUrl,
    port: grpcPort,
    options: ChannelOptions(
      credentials: ChannelCredentials.insecure(),
      codecRegistry:
      CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    ),
  );
  try {
    final client = IoTClient(channel);
    final responses = client.serverStreamingMethod(Request());
    await for (final res in responses) {
      fn(res.responseData.moisture.toString(), true);
    }
  } catch (e) {
    fn("connection error", false);
    print(e);
    await channel.shutdown();
  }
}
