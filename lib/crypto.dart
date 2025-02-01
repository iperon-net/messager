
import 'di.dart';
import 'logger.dart';

class Crypto {
  final logger = getIt.get<Logger>();

  Future<void> initialization() async {
    logger.debug("crypto initialization");
  }

}
