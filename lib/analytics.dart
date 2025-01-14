import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger/settings.dart';

import 'injection.dart';

@singleton
class Analytics {

  void initialize() {
    Settings settings = getIt.get<Settings>();
    AppMetrica.activate(AppMetricaConfig(settings.appMetricaKey));
  }

}
