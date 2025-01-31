
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'di.dart';
import 'logger.dart';

class Settings {
  final logger = getIt.get<Logger>();

  late FirebaseRemoteConfig remoteConfig;

  Future<void> initialization() async {
    await dotenv.load(fileName: ".env");

    remoteConfig = FirebaseRemoteConfig.instance;

    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: Duration(minutes: 1),
      minimumFetchInterval: kDebugMode ? Duration(hours: 1): Duration(hours: 12),
    ));

    await remoteConfig.setDefaults({
      "app_metrica_key": "130a5860-e40a-4361-851f-f595bd81e82a",
      "database_name": "iperon.db",
    });

    await remoteConfig.fetchAndActivate();

    logger.debug("settings initialization");
  }

  String get appMetricaKey {
    return remoteConfig.getString("app_metrica_key");
  }

  String get databaseName {
    return remoteConfig.getString("database_name");
  }

  bool get isDeleteDatabase {
    return dotenv.getBool("IS_DELETE_DATABASE", fallback: false);
  }

  int get databaseVersion {
    return dotenv.getInt("DATABASE_VERSION", fallback: 1);
  }




}
