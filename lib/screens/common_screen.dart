
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommonScreen {

  Widget notImplemented() {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text("Not implemented"),
        ),
      ),
    );
  }
}
