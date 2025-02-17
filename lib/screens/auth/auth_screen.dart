import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../contrib/di.dart';
import '../../contrib/utils.dart';

part 'auth_screen_ios.dart';
part 'auth_screen_android.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final utils = getIt.get<Utils>();

    if (utils.platform == SysPlatform.ios) {
      return AuthScreenIOS();
    } else {
      return AuthScreenAndroid();
    }

  }

}
