part of 'db.dart';

@injectable
class UsersDB {
  DB db = getIt.get<DB>();
  Logger logger = getIt.get<Logger>();

  Future<modeldb.Users> createOrUpdate({required modeldb.Users user}) async {

    await db.database.transaction((txn) async {
      await txn.delete("users", where: "user_id = ?", whereArgs: [user.userId]);
      await txn.insert("users", {...user.toJson()});
    });
    return user;
  }
}
