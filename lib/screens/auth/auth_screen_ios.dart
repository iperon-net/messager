part of 'auth_screen.dart';


class AuthScreenIOS extends StatelessWidget {
  const AuthScreenIOS({super.key});

  @override
  Widget build(BuildContext context) {
    // return Text("");
    return CupertinoPageScaffold(
      child: Form(
        // key: null,
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
                    // controller: controller.controllerEmail,
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
                  width: MediaQuery.of(context).size.width,
                  child: CupertinoButton.filled(
                    onPressed: () {},
                    child: Text(context.tr('continue')),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
}
