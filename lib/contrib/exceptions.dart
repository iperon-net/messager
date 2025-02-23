import 'package:grpc/grpc.dart';

import 'di.dart';
import 'logger.dart';
import 'settings.dart';

class BaseException implements Exception {
  String message;
  BaseException(this.message);
}


class ResultExceptionGrpc {
  final String error;
  final String codeName;
  ResultExceptionGrpc({this.error = "", this.codeName = ""});
}


class Exceptions {
  final logger = getIt.get<Logger>();
  final settings = getIt.get<Settings>();

  Future<void> initialization() async {
    logger.debug("exceptions initialization");
  }

  Future<ResultExceptionGrpc> grpc(Future Function() func) async {

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

}
