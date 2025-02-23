part of 'repositories.dart';


class Users {
  final Settings settings;
  final Logger logger;
  final Database database;

  Users({required this.logger, required this.settings, required this.database});

  Future<void> createOrUpdate({
    required String userId,
    required String email,
    required String sessionToken,
    required int isActive,
    required Uint8List sharedKey,
    required String server,
  }) async {

    database.transaction((txn) async {

      final result = await txn.query("users", where: "user_id = ?", whereArgs: [userId], limit: 1);
      if (result.isNotEmpty) {

        final result = await txn.update("users", {
          "user_id": userId,
          "email": email,
          "session_token": sessionToken,
          "is_active": isActive,
          "shared_key": sharedKey,
          "server": server,
        }, where: "user_id = ?", whereArgs: [userId]);

        if (result > 0) {
          logger.info("Update user, userId: $userId, email: $email");
        }

      } else {
        final result = await txn.insert("users", {
          "user_id": userId,
          "email": email,
          "session_token": sessionToken,
          "is_active": isActive,
          "shared_key": sharedKey,
          "server": server,
        });

        if (result > 0) {
          logger.info("Create user, userId: $userId, email: $email");
        }
      }

    });

    return;
  }

}
