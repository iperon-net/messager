import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'themes.dart';
import 'di.dart';
import 'logger.dart';
import 'utils.dart';

class Alert {
  String title;
  String message;

  bool i18n = false;
  Duration duration = const Duration(seconds: 10);

  Alert(this.title, this.message);
}

class Alerts {
  final logger = getIt.get<Logger>();
  final utils = getIt.get<Utils>();

  Future<void> initialization() async {}

  void showCupertinoAlertDialog(BuildContext context, {required String title, required String message, required bool i18n}) {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) =>
          CupertinoAlertDialog(
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

  void showMaterialAlertDialog(BuildContext context, {required String title, required String message, required Duration duration, required bool i18n}) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final showSnackBar = SnackBar(
      content: Text(i18n ? context.tr(message) : message),
      showCloseIcon: true,
      duration: duration,
      backgroundColor: AppColors.alertBackgroundColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(showSnackBar);
  }

  Future<void> reset(BuildContext context) async {
    if (utils.platform == SysPlatform.android && context.mounted) {
      ScaffoldMessenger.of(context).clearSnackBars();
    }
  }

  Future<void> show(BuildContext context, Alert alert) async {

    if (utils.platform == SysPlatform.ios && context.mounted) {
      showCupertinoAlertDialog(context, title: alert.title, message: alert.message, i18n: alert.i18n);
    } else if (utils.platform == SysPlatform.android && context.mounted) {
      showMaterialAlertDialog(context, title: alert.title, message: alert.message, i18n: alert.i18n, duration: alert.duration);
    }
  }
}
