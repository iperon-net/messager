import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'di.dart';
import 'logger.dart';
import 'utils.dart';

class Alerts {
  final logger = getIt.get<Logger>();
  final utils = getIt.get<Utils>();

  Future<void> initialization() async {}

  void showCupertinoAlertDialog(BuildContext context, {required String title, required String message, required bool i18n}) {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(i18n ? context.tr(title) : title),
        content: Text(i18n ? context.tr(message) : message),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(context.tr("close")),
          ),
        ],
      ),
    );
  }

  void showMaterialAlertDialog(BuildContext context, {required String title, required String message, required bool i18n}) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final showSnackBar = SnackBar(
      content: Text(i18n ? context.tr(message) : message),
      showCloseIcon: true,
      duration: const Duration(seconds: 5),
    );
    ScaffoldMessenger.of(context).showSnackBar(showSnackBar);
  }

  Future<void> show(BuildContext context, {required String title, required String message, bool i18n = false}) async {
    if (utils.platform == SysPlatform.ios && context.mounted) {
      showCupertinoAlertDialog(context, title: title, message: message, i18n: i18n);
    } else if (utils.platform == SysPlatform.android && context.mounted) {
      showMaterialAlertDialog(context, title: title, message: message, i18n: i18n);
    }
  }
}
