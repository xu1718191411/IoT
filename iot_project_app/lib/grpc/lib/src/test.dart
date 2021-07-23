import 'dart:convert';
import 'dart:io';

import 'package:grpc/grpc.dart';
import 'generated/iot.pbgrpc.dart';
import 'generated/iot.pb.dart';

final url = '192.168.2.104';
final port = 50051;

Future<void> main(List<String> args) async {
  final channel = ClientChannel(
    url,
    port: port,
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
      print(res);
    }
  } catch (e) {
    print(e);
    await channel.shutdown();
  }
}