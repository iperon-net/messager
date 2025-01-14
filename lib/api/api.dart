
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger/protobuf/protos/server.pbgrpc.dart';

import '../injection.dart';
import '../logger.dart';
import '../protobuf/protos/auth.pbgrpc.dart';
import '../settings.dart';

@singleton
class API {
  AuthClient get authClient => AuthClient(getClientChannel());
  ServerClient get serverClient => ServerClient(getClientChannel());

  // ChannelOptions
  ChannelOptions _getChannelOptions() {
    return ChannelOptions(
      credentials: const ChannelCredentials.secure(),
      idleTimeout: const Duration(minutes: 60),
      backoffStrategy: (_) => const Duration(seconds: 60),
      keepAlive: const ClientKeepAliveOptions(
        pingInterval: Duration(seconds: 60),
        permitWithoutCalls: true,
      ),
      codecRegistry: CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    );
  }

  // getClientChannel
  ClientChannel getClientChannel() {
    Settings settings = getIt.get<Settings>();

    return ClientChannel(settings.grpcHost, port: settings.grpcPort, options: _getChannelOptions());
  }

  // call
  Future<String> call(Function() func) async {
    Logger logger = getIt.get<Logger>();

    try {
      await func();
    } on GrpcError catch(err, _) {
      logger.error("${err.codeName.toString()}=${err.message.toString()}");

      if (err.codeName == "UNAVAILABLE"){
        return "errorConnecting";
      } else if(err.codeName == "UNKNOWN") {
        return "internalServerError";
      }

      return err.message.toString();
    } catch (err) {
      rethrow;
    }

    return "";
  }

}
