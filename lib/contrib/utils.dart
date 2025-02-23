import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:grpc/grpc.dart';
import 'package:messenger/exceptions.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:io' show Platform;

import 'alerts.dart';
import 'di.dart';
import 'logger.dart';
import 'settings.dart';

enum SysPlatform { android, ios }

class ResultExceptionGrpc {
  final String error;

  ResultExceptionGrpc({this.error = ""});
}



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

  Future<ResultExceptionGrpc> exceptionGrpc(Future Function() func) async {

    try {
      await func();
    } on GrpcError catch(error) {
      logger.error(error.toString());

      if (error.codeName == 'UNKNOWN') {
        RegExp expHttpConnection =  RegExp(r'^HTTP connection');
        Iterable<Match> matchesHttpConnection = expHttpConnection.allMatches(error.message.toString());
        if (matchesHttpConnection.isNotEmpty) {
          return ResultExceptionGrpc(error: "unableToExecuteTheRequest");
        }
        return ResultExceptionGrpc(error: "unknownRequestError");

      } else if (error.codeName == 'INVALID_ARGUMENT') {
        return ResultExceptionGrpc(error: error.message.toString());

      } else if (error.codeName == 'INTERNAL') {
        return ResultExceptionGrpc(error: error.message.toString());
      }

      return ResultExceptionGrpc();
    } on BaseException catch (error) {
      logger.error("Error exception: ${error.message}");
      return ResultExceptionGrpc(error: error.message);
    } catch (error) {
      logger.error("Error exception: $error");
      return ResultExceptionGrpc(error: error.toString());
    }

    return ResultExceptionGrpc();
  }

  // Future<R?> exception<R>(Future<R> Function() func) async {
  //
  //   try {
  //     return await func();
  //   } on BaseException catch(error) {
  //     logger.error("Error exception: ${error.message}");
  //     return null;
  //
  //   } catch (error) {
  //     logger.error("Error exception: $error");
  //     return null;
  //   }
  // }

}
