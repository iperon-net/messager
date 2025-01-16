import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import 'injection.dart';
import 'logger.dart';


@singleton
class Settings {

  @factoryMethod
  static Future<Settings> create() async {
    await dotenv.load(fileName: ".env", isOptional: true);

    // Remote config
    FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));

    await remoteConfig.setDefaults(const {
      "grpc_host": "production.iperon.net",
      "grpc_port": 443,
      "app_metrica_key": "130a5860-e40a-4361-851f-f595bd81e82a",
    });

    await remoteConfig.fetchAndActivate();

    return Settings();
  }

  bool get isDeleteDatabase {
    return dotenv.getBool("IS_DELETE_DATABASE", fallback: false);
  }

  String get databaseStorageKeyPassword {
    return dotenv.get("DATABASE_STORAGE_KEY_PASSWORD", fallback: "db_password");
  }

  String get databaseName {
    return dotenv.get("DATABASE_NAME", fallback: "iperon.db");
  }

  int get databaseVersion {
    return dotenv.getInt("DATABASE_VERSION", fallback: 1);
  }

  int get loggerMaxHistoryItems {
    return dotenv.getInt("LOGGER_MAX_HISTORY_ITEMS", fallback: 1000);
  }

  String get grpcHost {
    if (kDebugMode) return dotenv.get("GRPC_HOST", fallback: "staging.iperon.net");
    FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getString("grpc_host");
  }

  int get grpcPort {
    if (kDebugMode) return dotenv.getInt("GRPC_PORT", fallback: 443);
    FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getInt("grpc_port");
 }

  String get appMetricaKey {
    if (kDebugMode) return dotenv.get("APP_METRICA_KEY", fallback: "");
    FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    return remoteConfig.getString("app_metrica_key");
  }

}
