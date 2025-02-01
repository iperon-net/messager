import 'dart:async';

import 'di.dart';
import 'logger.dart';
import 'package:connectivity_plus/connectivity_plus.dart' as cp;

/* Usage

  final connectivity = getIt.get<Connectivity>();

  connectivity.stream.listen((onData) {
    logger.debug(onData.status.toString());
  });

  // or manual check
  await connectivity.checkConnectivity();

*/

enum ConnectivityStatus { online, offline }
enum ConnectivityDetail { wifi, mobile, none }


class ConnectivityResult {
  ConnectivityStatus status;
  ConnectivityDetail detail;

  ConnectivityResult({
    this.status = ConnectivityStatus.offline,
    this.detail = ConnectivityDetail.none,
  });

}

class Connectivity {
  final logger = getIt.get<Logger>();
  late StreamController<ConnectivityResult> streamController;

  Future<void> initialization() async {
    streamController = StreamController.broadcast();

    cp.Connectivity().onConnectivityChanged.listen((List<cp.ConnectivityResult> connectivityResult) {
      if (connectivityResult.contains(cp.ConnectivityResult.mobile)) {
        streamController.add(ConnectivityResult(status: ConnectivityStatus.online, detail: ConnectivityDetail.mobile));
        logger.info("The device is connected via mobile network");
      } else if (connectivityResult.contains(cp.ConnectivityResult.wifi)) {
        streamController.add(ConnectivityResult(status: ConnectivityStatus.online, detail: ConnectivityDetail.wifi));
        logger.info("The device is connected via wifi network");
      } else if (connectivityResult.contains(cp.ConnectivityResult.none)) {
        streamController.add(ConnectivityResult(status: ConnectivityStatus.offline, detail: ConnectivityDetail.none));
        logger.warning("Network unavailable");
      }
      // logger.debug(connectivityResult.toString());
    });

    logger.debug("connectivity initialization");
  }

  // Stream
  Stream<ConnectivityResult> get stream => streamController.stream;

  // check
  Future<ConnectivityResult> check() async {
    final List<cp.ConnectivityResult> connectivityResult = await (cp.Connectivity().checkConnectivity());

    if (connectivityResult.contains(cp.ConnectivityResult.mobile)) {
      logger.info("The device is connected via mobile network");
      return ConnectivityResult(status: ConnectivityStatus.online, detail: ConnectivityDetail.mobile);
    } else if (connectivityResult.contains(cp.ConnectivityResult.wifi)) {
      logger.info("The device is connected via wifi network");
      return ConnectivityResult(status: ConnectivityStatus.online, detail: ConnectivityDetail.wifi);
    }

    logger.warning("Network unavailable");
    return ConnectivityResult(status: ConnectivityStatus.offline, detail: ConnectivityDetail.none);
  }

}
