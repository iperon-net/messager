part of 'api.dart';

class Auth {
  final Settings settings;
  final Logger logger;
  final AuthClient authClient;

  Auth({required this.logger, required this.settings, required this.authClient});

  Future<AuthCreateByEmailResponse> createByEmail(String email) async {
    return await authClient.createByEmail(AuthCreateByEmailRequest(email: email));
  }


}
