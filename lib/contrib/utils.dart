import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:messenger/exceptions.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:io' show Platform;

import 'alerts.dart';
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

  /*
    final result = utils.exception(() async {
      throw BaseException("eeeee");
    }, context: context);
  */
  Future<R?> exception<R>(Future<R> Function() func, {BuildContext? context}) async {
    final alerts = getIt.get<Alerts>();

    try {
      return await func();
    } on BaseException catch(error, stacktrace) {
      logger.error("Error exception: ${error.message}");

      if (context != null){
        alerts.show(context, title: context.tr("error"), message: error.message);
      }
      return null;

    } catch (error) {
      logger.error("Error exception: $error");
      if (context != null){
        alerts.show(context, title: context.tr("error"), message: error.toString());
      }
      return null;
    }
  }

}
