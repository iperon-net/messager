import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
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
    FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
    await asyncPrefs.setBool("analytics", true);
  }

  Future<void> disable() async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(false);
    await asyncPrefs.remove("analytics");
  }

  Future<bool> _analyticsFlag() async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    final bool? flag = await asyncPrefs.getBool("analytics");
    if (flag != null && flag) return true;
    return false;
  }

  void sendEvent(String messageEvent) {
    AppMetrica.reportEvent(messageEvent);
  }

  Future<void> eventLogin(String method) async {
    if(!await _analyticsFlag()) return;

    await FirebaseAnalytics.instance.logLogin(loginMethod: method);

    Map<String, String> attributesMap = {"method": method};
    AppMetrica.reportEventWithMap("login", attributesMap);
  }

}
