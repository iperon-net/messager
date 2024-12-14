import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger/settings.dart';
import 'package:talker/talker.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';

// class CrashlyticsTalkerObserver extends TalkerObserver {
//   CrashlyticsTalkerObserver();
//
//   @override
//   void onError(err) {
//     FirebaseCrashlytics.instance.recordError(
//       err.error,
//       err.stackTrace,
//       reason: err.message,
//     );
//   }
//
//   @override
//   void onException(err) {
//     FirebaseCrashlytics.instance.recordError(
//       err.exception,
//       err.stackTrace,
//       reason: err.message,
//     );
//   }
// }

@singleton
class Logger {
  // final Talker logger = Talker(observer: CrashlyticsTalkerObserver());
  final Talker logger = Talker();

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

  @PostConstruct()
  Future<void> init() async {
    Settings settings = await Settings.create();

    Bloc.observer = TalkerBlocObserver(
      settings: const TalkerBlocLoggerSettings(
        enabled: true,
        printChanges: true,
        printClosings: true,
        printCreations: true,
        printEvents: true,
        printTransitions: true,
        printEventFullData: true,
        printStateFullData: true,
      ),
    );

    logger.configure(settings: TalkerSettings(
      enabled: true,
      useHistory: true,
      maxHistoryItems: settings.loggerMaxHistoryItems,
      useConsoleLogs: true,
      timeFormat: TimeFormat.yearMonthDayAndTime,
    ));

  }





}
