import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import 'connectivity.dart';
import 'firebase_options.dart';
import 'isolates.dart';
import 'logger.dart';
import 'repositories/repositories.dart';
import 'settings.dart';
import 'storage.dart';
import 'streams.dart';

GetIt getIt = GetIt.instance;

Future<void> configureDI() async {

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
      name: "Iperon messenger"
  );

  getIt.registerSingletonAsync<Logger>(() async {
    final logger = Logger();
    logger.initialization();
    return logger;
  });

  getIt.registerSingletonAsync<Settings>(() async {
    final settings = Settings();
    await settings.initialization();
    return settings;
  }, dependsOn: [Logger]);

  getIt.registerSingletonAsync<Storage>(() async {
    final storage = Storage();
    await storage.initialization();
    return storage;
  }, dependsOn: [Logger, Settings]);

  getIt.registerSingletonAsync<Repositories>(() async {
    final repositories = Repositories();
    await repositories.initialization();
    return repositories;
  }, dependsOn: [Logger, Settings, Storage]);

  getIt.registerSingletonAsync<Streams>(() async {
    final streams = Streams();
    await streams.initialization();
    return streams;
  }, dependsOn: [Logger, Settings, Repositories]);

  getIt.registerSingletonAsync<Connectivity>(() async {
    final connectivity = Connectivity();
    await connectivity.initialization();
    return connectivity;
  }, dependsOn: [Logger, Settings, Streams]);

  getIt.registerSingletonAsync<Isolates>(() async {
    final isolates = Isolates();
    // await isolates.initialization();
    return isolates;
  }, dependsOn: [Logger, Settings, Repositories, Streams]);

  await getIt.allReady();
}
