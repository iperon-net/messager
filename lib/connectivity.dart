import 'dart:async';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'settings.dart';
import 'di.dart';
import 'logger.dart';
import 'utils.dart';

/* Usage

  final connectivity = getIt.get<Connectivity>();

  connectivity.stream.listen((onData) {
    logger.debug(onData.status.toString());
  });

  // or manual check
  await connectivity.checkConnectivity();

*/

enum ConnectivityStatus { connected, disconnected }

class Connectivity {
  final logger = getIt.get<Logger>();
  final settings = getIt.get<Settings>();
  final utils = getIt.get<Utils>();

  late StreamController<ConnectivityStatus> streamController;

  Future<void> initialization() async {
    streamController = StreamController.broadcast();

    final connection = InternetConnection.createInstance(
      checkInterval: Duration(seconds: settings.healthcheckInterval),
      customCheckOptions: [
        InternetCheckOption(
            uri: Uri.parse(settings.healthcheckUrl),
            timeout: Duration(seconds: settings.healthcheckTimeout),
            headers: {"User-Agent": utils.userAgent}
        ),
      ],
    );

    connection.onStatusChange.listen((InternetStatus status) {
      if(status == InternetStatus.connected){
        streamController.add(ConnectivityStatus.connected);
        logger.info("The device is connected internet");
      } else {
        streamController.add(ConnectivityStatus.disconnected);
        logger.warning("The device is disconnected internet");
      }
    });

    logger.debug("connectivity initialization");
  }

  // Stream
  Stream<ConnectivityStatus> get stream => streamController.stream;

  // check
  Future<bool> get check async => await InternetConnection().hasInternetAccess;

}
