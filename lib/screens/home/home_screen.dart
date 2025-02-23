import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/not_implemented/not_implemented_component.dart';
import '../../di.dart';
import '../../utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // final utils = getIt.get<Utils>();
    return NotImplementedComponent();

    // if (utils.platform == SysPlatform.ios) {
    //   return AuthScreenIOS();
    // } else {
    //   return AuthScreenAndroid();
    // }
  }
}
