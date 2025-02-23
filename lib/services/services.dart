import 'dart:typed_data';

import '../di.dart';
import '../logger.dart';
import '../settings.dart';
import '../models/users.dart';
import '../repositories/repositories.dart';

part 'users.dart';

class Services {
  late Users users;

  final repositories = getIt.get<Repositories>();
  final settings = getIt.get<Settings>();
  final logger = getIt.get<Logger>();

  Future<void> initialization() async {
    users = Users(logger: logger, settings: settings, repositories: repositories);

    logger.debug("services initialization");
  }

}
