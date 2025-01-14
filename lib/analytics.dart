import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injection.dart';

@singleton
class Analytics {

  void initialize() {
    Settings settings = getIt.get<Settings>();
    AppMetrica.activate(AppMetricaConfig(settings.appMetricaKey, logs: true));
  }

  Future<void> enable() async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    await asyncPrefs.setBool("analytics", true);
  }

  Future<void> disable() async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    await asyncPrefs.remove("analytics");
  }

  Future<bool> _analyticsFlag() async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    final bool? flag = await asyncPrefs.getBool("analytics");
    if(flag != null && flag){
      return true;
    } else {
      return false;
    }
  }

  void sendEvent(String messageEvent) {
    AppMetrica.reportEvent(messageEvent);
  }

  Future<void> eventLogin(String method) async {
    if(!await _analyticsFlag()) return;

    Map<String, String> attributesMap = {"method": method};
    AppMetrica.reportEventWithMap("login", attributesMap);
  }

}
