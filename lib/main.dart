import 'dart:convert';
import 'dart:math';

import 'package:convert/convert.dart' as convert;
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:grpc/grpc.dart';
import 'package:messenger/contrib/di.dart';
import 'package:messenger/themes.dart';
import 'package:permission_handler/permission_handler.dart';

import 'components/not_implemented/not_implemented_component.dart';
import 'contrib/crypto.dart';
import 'contrib/settings.dart';
import 'contrib/utils.dart';
import 'firebase_options.dart';
import 'contrib/logger.dart';
import 'contrib/notifications.dart';
import 'protobuf/protos/auth.pbgrpc.dart';
import 'contrib/syncer.dart';
import 'routers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await configureDI();

  final utils = getIt.get<Utils>();
  final logger = getIt.get<Logger>();
  final crypto = getIt.get<Crypto>();
  final settings = getIt.get<Settings>();

  // final status = await Permission.camera.status;
  // logger.debug(status.toString());

  // final channelOptions = ChannelOptions(
  //   credentials: const ChannelCredentials.secure(
  //       // certificates:
  //   ),
  //   idleTimeout: const Duration(minutes: 60),
  //   backoffStrategy: (_) => const Duration(seconds: 60),
  //   keepAlive: const ClientKeepAliveOptions(
  //     pingInterval: Duration(seconds: 60),
  //     permitWithoutCalls: true,
  //   ),
  //   codecRegistry: CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  // );
  //
  //
  // final authClient = AuthClient(ClientChannel("developer.iperon.net", port: 443, options: channelOptions));
  //
  // final responseCreateByEmail = await authClient.createByEmail(AuthCreateByEmailRequest(email: "kostya@yandex.ru"));
  //
  // // Ecdh
  // final keyExchange = await crypto.keyExchangeGenerateKeyPair();
  //
  // final response = await authClient.confirmation(
  //     AuthConfirmationRequest(
  //       signInToken: responseCreateByEmail.signInToken,
  //       code: 555555,
  //       exchangeKey: keyExchange.publicKey,
  //     )
  // );
  //
  // final sharedKey = await crypto.keyExchangeValidate(keyPair: keyExchange.keyPair, remotePublicKey: response.exchangeKey);
  // logger.debug(base64.encode(sharedKey));
  // logger.debug(response.sessionToken);



  // String udid = await FlutterUdid.udid;
  // logger.debug(udid.toString());

  // d33055a70953714e
  // 9545EA22-64C1-4795-9153-A25F9FC3289E

  // final connectivity = getIt.get<Connectivity>();
  // final syncer = getIt.get<Syncer>();
  // final crypto = getIt.get<Crypto>();

  // final notifications = getIt.get<Notifications>();
  // await notifications.getPermissionRequests();

  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  // const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  //
  // final initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
  //
  // await flutterLocalNotificationsPlugin.initialize(
  //     initializationSettings,
  //     onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
  // );
  //
  // final androidNotificationDetails = AndroidNotificationDetails('2', 'Main channel2');
  // final notificationDetails = NotificationDetails(android: androidNotificationDetails);
  //
  // await flutterLocalNotificationsPlugin.show(Random().nextInt(1000000), 'Тест', 'Тело', notificationDetails, payload: null);

  // runApp(MultiBlocProvider(
  //   providers: [
  //     BlocProvider<BlocC>(
  //       create: (BuildContext context) => BlocC(),
  //     ),
  //   ],
  //   child: EasyLocalization(
  //     supportedLocales: <Locale>[
  //       const Locale('en', 'US')
  //     ],
  //     path: 'assets/translations',
  //     fallbackLocale: Locale('en', 'US'),
  //     child: utils.platform == SysPlatform.ios ? const IperonMessengerCupertino() : const IperonMessengerMaterial(),
  //   ),
  // ));

  runApp(EasyLocalization(
    supportedLocales: <Locale>[
      const Locale('en', 'US')
    ],
    path: 'assets/translations',
    saveLocale: true,
    assetLoader: YamlAssetLoader(),
    fallbackLocale: const Locale('en', 'US'),
    child: utils.platform == SysPlatform.ios ? const IperonMessengerCupertino() : const IperonMessengerMaterial(),
  ));

}

void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
  final String? payload = notificationResponse.payload;
  if (notificationResponse.payload != null) {
    debugPrint('notification payload: $payload');
  }
}

// Material app
class IperonMessengerMaterial extends StatelessWidget {
  const IperonMessengerMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: themeLight,
      routerConfig: router,
      // home: Center(child: Icon(CupertinoIcons.share)),
    );
  }
}

// Cupertino app
class IperonMessengerCupertino extends StatelessWidget {
  const IperonMessengerCupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: router,
        theme: const CupertinoThemeData(
          primaryColor: CupertinoDynamicColor.withBrightness(
            color: Color(0xff72538d),
            darkColor: Color(0xff605fc5),
          ),
          barBackgroundColor:CupertinoDynamicColor.withBrightness(
            color: Colors.white,
            darkColor: Color(0xff1b263b),
          ),
          scaffoldBackgroundColor: CupertinoDynamicColor.withBrightness(
            color: Colors.white,
            darkColor: Color(0xff1b263b),
          ),
          // textTheme: CupertinoTextThemeData(),
        ),
    );
  }
}
