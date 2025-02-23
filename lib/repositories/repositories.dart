import 'dart:math';

import 'package:flutter/foundation.dart';
import "package:path/path.dart" as p;
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_sqlcipher/sqflite.dart' as sqflite_sqlcipher;

import '../contrib/di.dart';
import '../contrib/logger.dart';
import '../contrib/settings.dart';
import '../contrib/storage.dart';

part 'users.dart';

class Repositories {
  final logger = getIt.get<Logger>();
  final settings = getIt.get<Settings>();
  final storage = getIt.get<Storage>();

  late Database database;
  late Users users;

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
          user_id TEXT NOT NULL,
          email TEXT NOT NULL,
          session_token TEXT NOT NULL,
          is_active INTEGER NOT NULL DEFAULT 0,
          shared_key BLOB NOT NULL,
          server TEXT NOT NULL DEFAULT ''
        )
      """);

      // batch.execute("""
      //   INSERT INTO users (email) VALUES ("kostya@yandex.ru")
      // """);

      await batch.commit();
    }

    // onUpgrade
    Future<void> onUpgrade(Database db, int oldVersion, int newVersion) async {}

    if (kDebugMode) {
      database = await openDatabase(
        path,
        version: settings.databaseVersion,
        onConfigure: onConfigure,
        onCreate: onCreate,
        onUpgrade: onUpgrade,
      );

      logger.warning("The database is not encrypted");
    } else {
      // Generate password for database
      String password = await storage.getSecure(key: "database_password");
      if (password.isEmpty) {
        password = await generatePassword();
        await storage.setSecure(key: "database_password", value: password);
        logger.info("A new password has been set for the database");
      }

      database = await sqflite_sqlcipher.openDatabase(
        path,
        version: settings.databaseVersion,
        password: password,
        onConfigure: onConfigure,
        onCreate: onCreate,
        onUpgrade: onUpgrade,
      );
    }

    //
    users = Users(logger: logger, settings: settings, database: database);

    final dbVersion = await database.getVersion();
    logger.info("Current DB version: $dbVersion");
  }

  // Generate password
  Future<String> generatePassword() async {
    final random = Random();
    final characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_-';
    String password = '';

    int min = 60;
    int max = 100;
    final rnd = Random();
    final length = min + rnd.nextInt(max - min);

    for (int i = 0; i < length; i++) {
      password += characters[random.nextInt(characters.length)];
    }

    return password;
  }
}
