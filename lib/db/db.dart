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
import 'models.dart' as modeldb;

part 'users.dart';


@singleton
class DB {
  late Database database;

  // Create or update user
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

    // onConfigure
    Future<void> onConfigure(Database db) async {
      await db.execute('PRAGMA foreign_keys = ON');
    }

    // Migrations
    Future<void> onCreate(Database db, int version) async {
      logger.info("Creating the database");

      Batch batch = db.batch();

      batch.execute("""
        CREATE TABLE users (
          user_id TEXT,
          email TEXT,
          access_token TEXT,
          refresh_token TEXT,
          expiration_time INTEGER
        )
      """);

      await batch.commit();
    }

    Future<void> onUpgrade(Database db, int oldVersion, int newVersion) async {
    }

    // Database
    late Database database;
    if(utils.isDebug) {
      database = await openDatabase(
        path,
        version: settings.databaseVersion,
        onConfigure: onConfigure,
        onCreate: onCreate,
        onUpgrade: onUpgrade,
      );
      logger.warning("The database is not encrypted");
    } else {
      database = await sqflite_sqlcipher.openDatabase(
        path,
        version: settings.databaseVersion,
        password: dbPassword,
        onConfigure: onConfigure,
        onCreate: onCreate,
        onUpgrade: onUpgrade,
      );
    }

    int dbVersion = await database.getVersion();
    logger.info("Current DB version: $dbVersion");
    return DB(database);
  }

  DB(Database db) {
    database = db;
  }

}
