import 'package:package_info_plus/package_info_plus.dart';
import 'dart:io' show Platform;

import 'di.dart';
import 'logger.dart';
import 'settings.dart';

enum SysPlatform { android, ios }

class Utils {
  final logger = getIt.get<Logger>();
  final settings = getIt.get<Settings>();

  late PackageInfo packageInfo;

  Future<void> initialization() async {
    packageInfo = await PackageInfo.fromPlatform();

    logger.debug("utils initialization");
  }

  String get userAgent => "${packageInfo.packageName}/${packageInfo.version}";

  SysPlatform get platform {
    if (Platform.isIOS) {
      return SysPlatform.ios;
    } else {
      return SysPlatform.android;
    }
  }

}
