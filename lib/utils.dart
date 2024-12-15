import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';


enum SystemPlatform { android, ios }


@singleton
class Utils {

  SystemPlatform get getPlatform {
    if (Platform.isAndroid) {
      return SystemPlatform.android;
    } else if (Platform.isIOS) {
      return SystemPlatform.ios;
    }
    throw Exception("Not found platform");
  }

  bool get isDebug {
    if (kDebugMode) {
      return true;
    }
    return false;
  }

}
