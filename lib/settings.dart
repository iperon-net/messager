import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';


@singleton
class Settings {
  @factoryMethod
  static Future<Settings> create() async {
    if (kDebugMode){
      await dotenv.load(fileName: ".env.development", isOptional: true);
    } else {
      await dotenv.load(fileName: ".env.production", isOptional: true);
    }
    return Settings();
  }

  bool get isDeleteDatabase {
    return dotenv.getBool("IS_DELETE_DATABASE", fallback: false);
  }

  int get databaseVersion {
    return dotenv.getInt("DATABASE_VERSION", fallback: 1);
  }

  int get loggerMaxHistoryItems {
    return dotenv.getInt("LOGGER_MAX_HISTORY_ITEMS", fallback: 1000);
  }

}
