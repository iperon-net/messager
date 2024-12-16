import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger/injection.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'logger.dart';

part 'utils.freezed.dart';

enum SystemPlatform { android, ios }

@freezed
class PackageInformation with _$PackageInformation {
  const factory PackageInformation({
    required String version,
    required String buildNumber,
    required String buildSignature,
    required String appName,
    required String packageName,
  }) = _PackageInformation;
}


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

  bool get isDebug => kDebugMode ? true : false;

  // Package information
  Future<PackageInformation> packageInformation() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    return PackageInformation(
      version: packageInfo.version,
      buildNumber: packageInfo.buildNumber,
      buildSignature: packageInfo.buildSignature,
      appName: packageInfo.appName,
      packageName: packageInfo.packageName,
    );
  }

}
