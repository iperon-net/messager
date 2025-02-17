import 'package:package_info_plus/package_info_plus.dart';

import 'di.dart';
import 'logger.dart';
import 'settings.dart';

class Utils {
  final logger = getIt.get<Logger>();
  final settings = getIt.get<Settings>();

  late PackageInfo packageInfo;

  Future<void> initialization() async {
    packageInfo = await PackageInfo.fromPlatform();

    logger.debug("utils initialization");
  }

  String get userAgent => "${packageInfo.packageName}/${packageInfo.version}";

}
