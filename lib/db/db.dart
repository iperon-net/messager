import 'package:basic_utils/basic_utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger/injection.dart';
import 'package:messenger/logger.dart';
import 'package:messenger/settings.dart';
import 'package:messenger/utils.dart';
import 'package:sqflite/sqflite.dart';
import "package:path/path.dart" as p;
import 'package:sqflite_sqlcipher/sqflite.dart' as sqflite_sqlcipher;
import 'models_db.dart' as models_db;

part 'version_db.dart';


@singleton
class DB {
  late Database database;

  static Future<String> getOrCreatePassword() async {
    FlutterSecureStorage storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(),
    );

    String? dbPassword = await storage.read(key: "db_password");
    if(dbPassword == null) {
      String dbPassword = StringUtils.generateRandomString(50, special: false);
      await storage.write(key: "db_password", value: dbPassword);
      return dbPassword;
    }
    return dbPassword.toString();
  }

  @factoryMethod
  static Future<DB> create() async {
    String databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'iperon.db');

    Settings settings = getIt.get<Settings>();
    Logger logger = getIt.get<Logger>();
    Utils utils = getIt.get<Utils>();

    String dbPassword = await getOrCreatePassword();

     // Delete the database
    if (settings.isDeleteDatabase) {
      logger.warning("Deleting the database, flag set IS_DELETE_DATABASE: ${settings.isDeleteDatabase.toString()}");
      await deleteDatabase(path);
    }

    // Migrations
    onCreate(Database db, int version) async {
      logger.info("Creating the database");

      await db.execute("""
        CREATE TABLE accounts (
          account_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          username TEXT,
          password TEXT,
          expiration_time INTEGER
        )
      """);
    }

    // Database
    late Database database;
    if(utils.isDebug) {
      database = await openDatabase(
        path,
        version: settings.databaseVersion,
        onCreate: onCreate,
      );
      logger.warning("The database is not encrypted");
    } else {
      database = await sqflite_sqlcipher.openDatabase(
        path,
        version: settings.databaseVersion,
        onCreate: onCreate,
        password: dbPassword,
      );
    }

    int dbVersion = await database.getVersion();
    logger.info("DB Version: $dbVersion");
    return DB(database);
  }

  DB(Database db) {
    database = db;
  }

}
