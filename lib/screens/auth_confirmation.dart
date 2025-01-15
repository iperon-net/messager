import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger/cubit/common_cubit.dart';
import 'package:messenger/injection.dart';
import 'package:messenger/screens/common_screen.dart';

import '../constants.dart';
import '../cubit/auth_confirmation_cubit.dart';
import '../utils.dart';

class AuthConfirmationScreen extends StatelessWidget {
  final String signInToken;

  const AuthConfirmationScreen({super.key, required this.signInToken});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    AuthConfirmation authConfirmation = AuthConfirmation(context);

    Utils utils = getIt.get<Utils>();
    if (utils.getPlatform == SystemPlatform.android) {
      return authConfirmation.android(signInToken);
    }
    return authConfirmation.notImplemented();
  }
}

class AuthConfirmation extends CommonScreen {
  late BuildContext context;
  final GlobalKey<FormState> formKeyAuth  = GlobalKey<FormState>();
  final FocusNode focusNodeCode = FocusNode();
  final textControllerCode = TextEditingController();
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  AuthConfirmation(this.context);

  // Android
  Widget android(String signInToken) {
    if(utils.isDebug) textControllerCode.text = "555555";

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Form(
          key: formKeyAuth,
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
                  focusNode: focusNodeCode,
                  controller: textControllerCode,
                  cursorColor: AppColors.primaryColor,
                  cursorErrorColor: AppColors.primaryColor,
                  validator: (value) => context.read<AuthConfirmationCubit>().validationCode(context, value),
                  style: const TextStyle(fontSize:15),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(6),
                  ],
                  decoration: InputDecoration(
                    labelText: context.tr("confirmationCode"),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(context.tr("signIn")),
                    onPressed: () async {
                      // throw Exception();

                      focusNodeCode.unfocus();
                      ScaffoldMessenger.of(context).clearSnackBars();

                      if(!context.read<CommonCubit>().state.connectivity) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: AppColors.snackBarBackgroundColor,
                            content: Text(context.tr('notInternetConnection')),
                          ),
                        );
                        return;
                      }

                      await context.read<AuthConfirmationCubit>().validator(context, formKeyAuth, textControllerCode);

                      if (context.mounted && context.read<AuthConfirmationCubit>().state.error.isNotEmpty) {
                        final error = context.read<AuthConfirmationCubit>().state.error;

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            showCloseIcon: true,
                            backgroundColor: AppColors.snackBarBackgroundColor,
                            content: Text(context.tr(error.toString())),
                          ),
                        );
                        return;
                      }

                      // if (context.mounted && context.read<AuthConfirmationCubit>().state.signInToken.isNotEmpty) {
                      //     String signInToken = context.read<AuthConfirmationCubit>().state.signInToken;
                      //     context.goNamed("auth_confirmation", pathParameters: {"signInToken": signInToken});
                      // }
                    },
                  ),
                ),
                // Text(context.watch<AuthCubit>().state.loading.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }


}

