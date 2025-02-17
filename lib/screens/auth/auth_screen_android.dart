part of 'auth_screen.dart';


class AuthScreenAndroid extends StatelessWidget {
  const AuthScreenAndroid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        // key: context.read<AuthCubit>().formKeyAuth,
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
                      onPressed: () {}
                    ),
                  ),

                ]
            ),
          ),
        ),
      ),
    );
  }

}
