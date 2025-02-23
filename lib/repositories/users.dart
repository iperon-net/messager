part of 'repositories.dart';


class Users {
  final Settings settings;
  final Logger logger;
  final Database database;

  Users({required this.logger, required this.settings, required this.database});

  // Create or update user
  Future<void> createOrUpdate({
    required String userId,
    required String email,
    required String sessionToken,
    required int isActive,
    required Uint8List sharedKey,
    required String server,
  }) async {

    await database.transaction((txn) async {
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

  // Reset active
  Future<void> resetActive() async {
    await database.transaction((txn) async {
      await txn.update("users", {"is_active": 0});
    });
  }

  // Get active user
  Future<Map<String, dynamic>> getActive() async {
    final user = await database.query("users", where: "is_active = 1", limit: 1);
    if (user.isNotEmpty) {
      return user.last;
    }
    throw Exception("Not found active user");
  }

}
