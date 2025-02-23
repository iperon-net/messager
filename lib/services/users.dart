part of 'services.dart';


class Users {
  final Settings settings;
  final Logger logger;
  final Repositories repositories;

  Users({required this.logger, required this.settings, required this.repositories});

  // Create or update
  Future<void> createOrUpdate({
    required String userId,
    required String email,
    required String sessionToken,
    required int isActive,
    required Uint8List sharedKey,
    required String server,
  }) async {

    await resetActive();
    await repositories.users.createOrUpdate(
      userId: userId,
      email: email,
      sessionToken: sessionToken,
      isActive: isActive,
      sharedKey: sharedKey,
      server: server,
    );

  }

  // Reset active
  Future<void> resetActive() async {
    await repositories.users.resetActive();
  }

  // Get active
  Future<User> getActive() async {
    final user = await repositories.users.getActive();
    return User(
        userId: user["user_id"],
        email: user["email"],
        sessionToken: user["session_token"],
        isActive: user["is_active"],
        sharedKey: user["shared_key"],
        server: user["server"],
    );
  }

}
