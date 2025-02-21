import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../contrib/di.dart';
import '../../contrib/logger.dart';
import '../../contrib/utils.dart';
import '../../themes.dart';
import 'auth_cubit.dart';


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


class AuthScreenAndroid extends StatelessWidget {
  const AuthScreenAndroid({super.key});

  @override
  Widget build(BuildContext context) {
    final logger = getIt.get<Logger>();

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: Form(
            key: state.formKey,
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Image(
                        width: 150,
                        image: AssetImage('assets/images/logo.png'),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        // onTap: () => ScaffoldMessenger.of(context).clearSnackBars(),
                        onTap: () {},
                        // validator: (value) => context.read<AuthCubit>().validatorEmail(context, value),
                        // focusNode: context.read<AuthCubit>().focusNodeEmail,
                        // controller: context.read<AuthCubit>().textControllerEmail,
                        style: const TextStyle(fontSize: 15),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: context.tr("emailAddress"),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Button
                      SizedBox(
                        child: ElevatedButton(
                          child: Text(context.tr("continue")),
                          onPressed: () async => context.read<AuthCubit>().validator(context),
                        ),
                      ),

                    ]
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}

class AuthScreenIOS extends StatelessWidget {
  const AuthScreenIOS({super.key});

  @override
  Widget build(BuildContext context) {
    final logger = getIt.get<Logger>();

    // void _showAlertDialog(BuildContext context) {
    //   showCupertinoDialog<void>(
    //     context: context,
    //     builder:
    //         (BuildContext context) => CupertinoAlertDialog(
    //       title: const Text('Alert'),
    //       content: const Text('Proceed with destructive action?'),
    //       actions: <CupertinoDialogAction>[
    //         CupertinoDialogAction(
    //           /// This parameter indicates this action is the default,
    //           /// and turns the action's text to bold text.
    //           isDefaultAction: true,
    //           onPressed: () {
    //             Navigator.pop(context);
    //           },
    //           child: const Text('No'),
    //         ),
    //         CupertinoDialogAction(
    //           /// This parameter indicates the action would perform
    //           /// a destructive action such as deletion, and turns
    //           /// the action's text color to red.
    //           isDestructiveAction: true,
    //           onPressed: () {
    //             Navigator.pop(context);
    //           },
    //           child: const Text('Yes'),
    //         ),
    //       ],
    //     ),
    //   );
    // }
    //
    // WidgetsBinding.instance.addPostFrameCallback((_){
    //   _showAlertDialog(context);
    // });

    return CupertinoPageScaffold(
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Form(
            key: state.formKey,
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Center(
                      child: Image(
                        image: AssetImage('assets/images/logo.png'),
                        width: 150,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 1, 0, 1),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: const CupertinoDynamicColor.withBrightness(
                              color: Colors.black12,
                              darkColor: Colors.white24,
                            ).resolveFrom(context),
                          ),
                          bottom: BorderSide(
                            color: const CupertinoDynamicColor.withBrightness(
                              color: Colors.black12,
                              darkColor: Colors.white24,
                            ).resolveFrom(context),
                          ),
                        ),
                      ),
                      child: CupertinoTextFormFieldRow(
                        autocorrect: true,
                        autofocus: true,
                        controller: state.textControllerEmail,
                        focusNode: state.focusNodeEmail,
                        keyboardType: TextInputType.emailAddress,
                        prefix: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Text(context.tr('email')),
                        ),
                        // placeholder: 'enter_email_address'.tr,
                        validator: (value) => null,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: CupertinoButton.filled(
                        onPressed: () async => context.read<AuthCubit>().validator(context),
                        child: Text(context.tr('continue')),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

