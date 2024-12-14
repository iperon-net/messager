import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  final GlobalKey<FormState> _formKeyAuth = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    final focusNodeEmail = FocusNode();
    // final focusNodePassword = FocusNode();

    return Scaffold(
      body: Form(
        key: _formKeyAuth,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  width: 150,
                  image: AssetImage('assets/images/logo.png'),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  onTap: () => ScaffoldMessenger.of(context).clearSnackBars(),
                  focusNode: focusNodeEmail,
                  controller: null,
                  // cursorColor: AppColors.primaryColor,
                  // cursorErrorColor: AppColors.primaryColor,
                  validator: (value) => null,
                  style: const TextStyle(fontSize:15),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: context.tr("emailAddress"),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
