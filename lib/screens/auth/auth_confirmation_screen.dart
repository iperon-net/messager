import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger/screens/auth/auth_confirmation_cubit.dart';

import '../../contrib/di.dart';
import '../../contrib/logger.dart';

class AuthConfirmationScreen extends StatelessWidget {
  const AuthConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // final utils = getIt.get<Utils>();

    // if (utils.platform == SysPlatform.ios) {
    //   return AuthConfirmationIOS();
    // } else {
    //   return AuthConfirmationAndroid();
    // }

    return AuthConfirmationAndroid();

  }
}

// Android
class AuthConfirmationAndroid extends StatelessWidget {
  const AuthConfirmationAndroid({super.key});

  @override
  Widget build(BuildContext context) {
    // final logger = getIt.get<Logger>();

    return BlocBuilder<AuthConfirmationCubit, AuthConfirmationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
          ),
          body: Form(
            key: state.formKey,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
                const Image(
                  width: 150,
                  image: AssetImage('assets/images/logo.png'),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  autofocus: true,
                  // onTap: () => context.read<AuthConfirmationCubit>().onTabEmail(context),
                  validator: (value) => context.read<AuthConfirmationCubit>().validatorCode(context, value),
                  focusNode: state.focusNodeCode,
                  controller: state.textControllerCode,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: context.tr("confirmationCode"),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(6),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    child: Text(context.tr("signIn")),
                    onPressed: () async => context.read<AuthConfirmationCubit>().validator(context),
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
