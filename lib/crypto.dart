
import 'dart:convert';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:cryptography/dart.dart';
import 'package:fernet/fernet.dart';

import 'di.dart';
import 'logger.dart';

class CryptoKeyExchangeGenerateKeyPair {
  SimpleKeyPair keyPair;
  List<int> publicKey;
  CryptoKeyExchangeGenerateKeyPair({required this.keyPair, required this.publicKey});
}

/* Usage
  final crypto = getIt.get<Crypto>();

  // Decode and encode
  final signingKey = crypto.stringToUint8List("dF8jR2OXQwNTiMK_gyT5Qa7tAlkKoMHKaY81MhE9dEQ=");
  final cryptText = await crypto.encrypt(crypto.stringToUint8List("Test test"), signingKey: signingKey);

  final plainTextByte = await crypto.decrypt(cryptText, signingKey: signingKey);

  final plainText = crypto.uint8ListToString(plainTextByte);
  logger.debug(plainText);

  final keyExchange = await crypto.keyExchangeGenerateKeyPair();
  logger.debug(keyExchange.publicKey);

  String sharedKey = await crypto.keyExchangeValidate(
      keyPair: keyExchange.keyPair,
      remotePublicKey: "Fs2j12qfkffhvMCgP/iadxhb3ZrqFTMEkc52ghrbWTs=",
  );
  logger.debug("sharedKey = $sharedKey");

*/


class Crypto {
  final logger = getIt.get<Logger>();
  final algorithm = X25519();

  Future<void> initialization() async {
    logger.debug("crypto initialization");
  }

  Uint8List stringToUint8List(String message) {
    return Uint8List.fromList(utf8.encode(message));
  }

  String uint8ListToString(Uint8List message) {
    return utf8.decode(message);
  }

  Future<Uint8List> encrypt(Uint8List message, {required Uint8List signingKey}) async {
    final fernet = Fernet(signingKey);
    return fernet.encrypt(message);
  }

  Future<Uint8List> decrypt(Uint8List message, {required Uint8List signingKey}) async {
    final fernet = Fernet(signingKey);
    return fernet.decrypt(message);
  }

  // Key exchange
  Future<CryptoKeyExchangeGenerateKeyPair> keyExchangeGenerateKeyPair() async {
    final keyPair = await algorithm.newKeyPair();
    final publicKeyBinary = await keyPair.extractPublicKey();
    return CryptoKeyExchangeGenerateKeyPair(keyPair: keyPair, publicKey: publicKeyBinary.bytes);
  }

  Future<List<int>> keyExchangeValidate({required SimpleKeyPair keyPair, required List<int> remotePublicKey}) async {
    final keyPairRemote = SimplePublicKey(remotePublicKey, type: DartX25519().keyPairType);
    final algorithm = X25519();

    final sharedSecret = await algorithm.sharedSecretKey(
      keyPair: keyPair,
      remotePublicKey: keyPairRemote,
    );

    return sharedSecret.extractBytes();
  }

}
