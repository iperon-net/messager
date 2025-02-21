import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../contrib/di.dart';
import '../../contrib/utils.dart';

class NotImplementedComponent extends StatelessWidget {
  const NotImplementedComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final utils = getIt.get<Utils>();

    if (utils.platform == SysPlatform.ios) {
      return CupertinoPageScaffold(
        child: Center(child: Text(context.tr("notImplementedScreen"))),
      );
    }

    return Scaffold(
      body: Center(child: Text(context.tr("notImplementedScreen"))),
    );
  }
}
