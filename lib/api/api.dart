import 'package:grpc/grpc.dart';

import '../di.dart';
import '../logger.dart';
import '../settings.dart';
import '../protobuf/protos/auth.pbgrpc.dart';

part 'auth.dart';

class API {
  final logger = getIt.get<Logger>();
  final settings = getIt.get<Settings>();

  late Auth auth;

  Future<void> initialization() async {
    logger.debug("api initialization");

    final channelOptions = ChannelOptions(
      credentials: const ChannelCredentials.secure(),
      idleTimeout: const Duration(minutes: 60),
      backoffStrategy: (_) => const Duration(seconds: 60),
      keepAlive: const ClientKeepAliveOptions(
        pingInterval: Duration(seconds: 60),
        permitWithoutCalls: true,
      ),
      codecRegistry: CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    );

    final clientChannel = ClientChannel("developer.iperon.net", port: 443, options: channelOptions);
    final authClient = AuthClient(clientChannel);

    auth = Auth(logger: logger, settings: settings, authClient: authClient);
  }

}
