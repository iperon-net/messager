part of 'api.dart';

class Auth {
  final Settings settings;
  final Logger logger;
  final AuthClient authClient;

  Auth({required this.logger, required this.settings, required this.authClient});

  // createByEmail
  Future<AuthCreateByEmailResponse> createByEmail(String email) async {
    return await authClient.createByEmail(AuthCreateByEmailRequest(email: email));
  }

  // Confirmation
  Future<AuthConfirmationResponse> confirmation({
    required String signInToken,
    required int code,
    required List<int> exchangeKey,
  }) async {
    final req = AuthConfirmationRequest(signInToken: signInToken, code: code, exchangeKey: exchangeKey);
    return await authClient.confirmation(req);
  }


}
