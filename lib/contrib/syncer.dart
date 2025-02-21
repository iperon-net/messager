import 'dart:async';
import 'dart:isolate';

import 'di.dart';
import 'logger.dart';
import 'settings.dart';

class IsolatesParamsSyncer {
  final SendPort sendPort;
  IsolatesParamsSyncer({required this.sendPort});
}

class Syncer {
  final logger = getIt.get<Logger>();
  final settings = getIt.get<Settings>();
  late StreamController<DateTime> streamController;

  late Isolate isolateSyncer;
  late bool isRunningSyncer = false;

  Future<void> initialization() async {
    streamController = StreamController.broadcast();
    logger.debug("syncer initialization");
  }

  Future<void> startSyncer() async {
    if (isRunningSyncer) return;

    final receivePort = ReceivePort();
    final params = IsolatesParamsSyncer(sendPort: receivePort.sendPort);
    isolateSyncer = await Isolate.spawn(syncer, params);

    receivePort.listen((message) {
      streamController.add(message);
    });

    isRunningSyncer = true;
  }

  // Stream
  Stream<DateTime> get stream => streamController.stream;

  // Fake sync server
  Future<void> syncer(IsolatesParamsSyncer params) async {
    for (int i = 1; i >= 1; i++) {
      final dt = DateTime.now();
      params.sendPort.send(dt);
      await Future.delayed(Duration(seconds: 5));
    }
  }
}
