import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../contrib/di.dart';
import '../../contrib/utils.dart';
import '../../themes.dart';

part 'auth_screen_ios.dart';
part 'auth_screen_android.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    final utils = getIt.get<Utils>();

    if (utils.platform == SysPlatform.ios) {
      return AuthScreenIOS();
    } else {
      return AuthScreenAndroid();
    }

  }

}
