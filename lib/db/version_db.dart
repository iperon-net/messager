part of 'db.dart';

@injectable
class VersionDB {
  DB db = getIt.get<DB>();
  Logger logger = getIt.get<Logger>();

  Future<models_db.VersionDB> version() async {
    // var lastInsertId = await db.database.insert('accounts', {'username': 'kostya', 'password': 'password', 'expiration_time': 1234});
    // logger.debug(lastInsertId.toString());

    var list = await db.database.query('accounts', columns: ['account_id', 'username', 'password'], where: "username = 'kostya'");

    logger.debug(list.toString());


    List<Map<String, Object?>> response = await db.database.rawQuery("SELECT sqlite_version() as version;");

    if (response.first.isNotEmpty) {
      return const models_db.VersionDB(version: "www");
    }
    return const models_db.VersionDB(version: "");
  }

}
