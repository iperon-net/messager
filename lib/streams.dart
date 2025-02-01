import 'dart:async';
import 'dart:ffi';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'di.dart';
import 'logger.dart';

class Streams {
  final logger = getIt.get<Logger>();
  late StreamController streamControllerSync;

  Future<void> initialization() async {
    await openStreamSync();
    logger.debug("streams initialization");
  }

  Future<void> openStreamSync({bool ignoreCheckClose = false}) async {
    logger.debug("!!!!");
     // streamControllerSync.toString()

    streamControllerSync = StreamController.broadcast(onListen: () {
      logger.debug("stream controller sync event onListen");
    }, onCancel: () {
      logger.debug("stream controller sync event onCancel");
    });

  }


}
