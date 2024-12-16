import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger/cubit/debug_cubit.dart';
import 'package:messenger/injection.dart';
import 'package:messenger/screens/common_screen.dart';

import '../utils.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    Auth auth = Auth(context);

    Utils utils = getIt.get<Utils>();
    if (utils.getPlatform == SystemPlatform.android) {
      return auth.android();
    }
    return auth.notImplemented();
  }
}

class Auth extends CommonScreen {
  late BuildContext context;
  final GlobalKey<FormState> formKeyAuth  = GlobalKey<FormState>();
  final FocusNode focusNodeEmail = FocusNode();

  Auth(this.context);

  // Android
  Widget android() {
    return Scaffold(
      body: Form(
        key: formKeyAuth,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => context.read<DebugCubit>().increment(context),
                  child: const Image(
                    width: 150,
                    image: AssetImage('assets/images/logo.png'),
                  ),
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
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(context.tr("continue")),
                    onPressed: () async {
                      focusNodeEmail.unfocus();
                      ScaffoldMessenger.of(context).clearSnackBars();

                      // await context.read<AuthCubit>().validator(_formKeyAuth);

                      // if(context.mounted && context.read<AuthCubit>().state.error.isNotEmpty){
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       backgroundColor: AppColors.snackBarBackgroundColor,
                      //       content: Text(context.tr(context.read<AuthCubit>().state.error.toString())),
                      //     ),
                      //   );
                      // }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}

