import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import 'firebase_options.dart';
import 'logger.dart';
import 'settings.dart';

GetIt getIt = GetIt.instance;

Future<void> configureDI() async {

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
      name: "Iperon messenger"
  );

  // getIt.registerSingleton(Logger()..initialization());

  getIt.registerSingletonAsync<Logger>(() async {
    final logger = Logger();
    logger.initialization();
    return logger;
  });

  getIt.registerSingletonAsync<Settings>(() async {
    final Settings settings = Settings();
    await settings.initialization();
    return settings;
  }, dependsOn: [Logger]);

  await getIt.allReady();
}
