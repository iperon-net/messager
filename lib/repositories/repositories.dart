import 'package:sqflite/sqflite.dart';
import "package:path/path.dart" as p;

import '../di.dart';
import '../logger.dart';
import '../settings.dart';

class Repositories {
  final logger = getIt.get<Logger>();
  final settings = getIt.get<Settings>();

  late Database database;

  Future<void> initialization() async {
    String databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, settings.databaseName);

    // Delete the database
    if (settings.isDeleteDatabase) {
      logger.warning("Deleting the database, flag set IS_DELETE_DATABASE: ${settings.isDeleteDatabase.toString()}");
      await deleteDatabase(path);
    }

    // onConfigure
    Future<void> onConfigure(Database db) async {
      await db.execute('PRAGMA foreign_keys = ON');
    }

    // onCreate
    Future<void> onCreate(Database db, int version) async {
      logger.info("Creating the database");
      Batch batch = db.batch();

      batch.execute("""
        CREATE TABLE users (
          email TEXT NOT NULL DEFAULT "",
          username TEXT NOT NULL DEFAULT "",
          session TEXT NOT NULL DEFAULT "",
          is_active INTEGER NOT NULL DEFAULT 0,
          crypto_key TEXT NOT NULL DEFAULT ""
        )
      """);

      batch.execute("""
        INSERT INTO users (email) VALUES("kostya@yandex.ru")
      """);

      await batch.commit();

    }

    // onUpgrade
    Future<void> onUpgrade(Database db, int oldVersion, int newVersion) async {
    }

    database = await openDatabase(
      path,
      version: settings.databaseVersion,
      onConfigure: onConfigure,
      onCreate: onCreate,
      onUpgrade: onUpgrade,
    );
    int dbVersion = await database.getVersion();
    logger.info("Current DB version: $dbVersion");
  }


}
