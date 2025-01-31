import 'package:talker/talker.dart';

class Logger {
  final logger = Talker();

  void initialization() {
    logger.debug("logger initialization");
  }

  void debug(String message) {
    logger.debug(message);
  }

  void warning(String message) {
    logger.warning(message);
  }

  void info(String message) {
    logger.info(message);
  }

  void error(String message) {
    logger.error(message);
  }

  void critical(String message) {
    logger.critical(message);
  }

}
