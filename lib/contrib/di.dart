import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import '../api/api.dart';
import '../services/services.dart';
import 'alerts.dart';
import 'connectivity.dart';
import 'crypto.dart';
import '../firebase_options.dart';
import 'exceptions.dart';
import 'logger.dart';
import 'notifications.dart';
import '../repositories/repositories.dart';
import 'settings.dart';
import 'storage.dart';
import 'syncer.dart';
import 'utils.dart';

GetIt getIt = GetIt.instance;

Future<void> configureDI() async {
  // Firebase initialize
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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

  getIt.registerSingletonAsync<Utils>(() async {
    final utils = Utils();
    await utils.initialization();
    return utils;
  }, dependsOn: [Logger, Settings]);

  getIt.registerSingletonAsync<Storage>(() async {
    final storage = Storage();
    await storage.initialization();
    return storage;
  }, dependsOn: [Logger, Settings]);

  getIt.registerSingletonAsync<Crypto>(() async {
    final crypto = Crypto();
    await crypto.initialization();
    return crypto;
  }, dependsOn: [Logger, Settings]);

  getIt.registerSingletonAsync<Exceptions>(() async {
    final exceptions = Exceptions();
    await exceptions.initialization();
    return exceptions;
  }, dependsOn: [Logger, Settings]);

  getIt.registerSingletonAsync<Connectivity>(() async {
    final connectivity = Connectivity();
    await connectivity.initialization();
    return connectivity;
  }, dependsOn: [Logger, Settings, Utils]);

  getIt.registerSingletonAsync<Alerts>(() async {
    final alerts = Alerts();
    await alerts.initialization();
    return alerts;
  }, dependsOn: [Logger, Settings, Utils]);

  getIt.registerSingletonAsync<Repositories>(() async {
    final repositories = Repositories();
    await repositories.initialization();
    return repositories;
  }, dependsOn: [Logger, Settings, Storage]);

  getIt.registerSingletonAsync<API>(() async {
    final api = API();
    await api.initialization();
    return api;
  }, dependsOn: [Logger, Settings, Storage]);

  getIt.registerSingletonAsync<Notifications>(() async {
    final notifications = Notifications();
    await notifications.initialization();
    return notifications;
  }, dependsOn: [Logger, Settings, Storage, Repositories]);

  getIt.registerSingletonAsync<Syncer>(() async {
    final syncer = Syncer();
    await syncer.initialization();
    return syncer;
  }, dependsOn: [Logger, Settings, Storage, Repositories]);

  getIt.registerSingletonAsync<Services>(() async {
    final services = Services();
    await services.initialization();
    return services;
  }, dependsOn: [Logger, Settings, Storage, Repositories]);


  await getIt.allReady();
}
