
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../injection.dart';
import '../utils.dart';

class CommonScreen {
  Utils utils = getIt.get<Utils>();

  Widget notImplemented() {
    return MaterialApp(
      debugShowCheckedModeBanner: utils.isDebug ? true : false,
      home: const Scaffold(
        body: Center(
          child: Text("Not implemented"),
        ),
      ),
    );
  }
}
