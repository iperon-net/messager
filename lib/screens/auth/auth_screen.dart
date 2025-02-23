import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di.dart';
// import '../../logger.dart';
import '../../utils.dart';
import 'auth_cubit.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    final utils = getIt.get<Utils>();

    if (utils.platform == SysPlatform.ios) {
      return AuthScreenIOS();
    } else {
      return AuthScreenAndroid();
    }
  }
}

// Android
class AuthScreenAndroid extends StatelessWidget {
  const AuthScreenAndroid({super.key});

  @override
  Widget build(BuildContext context) {
    // final logger = getIt.get<Logger>();

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: Form(
            key: state.formKey,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
                const Image(
                  width: 150,
                  image: AssetImage('assets/images/logo.png'),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  autofocus: true,
                  onTap: () => context.read<AuthCubit>().onTabEmail(context),
                  validator: (value) => context.read<AuthCubit>().validatorEmail(context, value),
                  focusNode: state.focusNodeEmail,
                  controller: state.textControllerEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: context.tr("emailAddress"),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter,
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    child: Text(context.tr("continue")),
                    onPressed: () async => context.read<AuthCubit>().validator(context),
                  ),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}

// iOS
class AuthScreenIOS extends StatelessWidget {
  const AuthScreenIOS({super.key});

  @override
  Widget build(BuildContext context) {
    // final logger = getIt.get<Logger>();

    return CupertinoPageScaffold(
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Form(
            key: state.formKey,
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
                      validator: (value) => context.read<AuthCubit>().validatorEmail(context, value),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CupertinoButton.filled(
                      onPressed: () async => context.read<AuthCubit>().validator(context),
                      child: Text(context.tr('continue')),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
