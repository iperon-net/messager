import 'package:talker/talker.dart';

class Logger {
  final _logger = Talker();

  void initialization() {
    _logger.configure(
      settings: TalkerSettings(
        enabled: true,
        useHistory: true,
        maxHistoryItems: 1000,
        useConsoleLogs: true,
        timeFormat: TimeFormat.timeAndSeconds,
      ),
      logger: TalkerLogger(),
    );
    _logger.debug("logger initialization");
  }

  void debug(String message) {
    _logger.debug(message);
  }

  void warning(String message) {
    _logger.warning(message);
  }

  void info(String message) {
    _logger.info(message);
  }

  void error(String message) {
    _logger.error(message);
  }

  void critical(String message) {
    _logger.critical(message);
  }
}
