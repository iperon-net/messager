import 'dart:convert';
import 'dart:math';

import 'package:convert/convert.dart' as convert;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:grpc/grpc.dart';
import 'package:messenger/di.dart';
import 'package:messenger/settings.dart';
import 'package:permission_handler/permission_handler.dart';

import 'crypto.dart';
import 'firebase_options.dart';
import 'logger.dart';
import 'notifications.dart';
import 'protobuf/protos/auth.pbgrpc.dart';
import 'syncer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDI();

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

  runApp(const MyApp());
}

void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
  final String? payload = notificationResponse.payload;
  if (notificationResponse.payload != null) {
    debugPrint('notification payload: $payload');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Чаты'),
          // bottom: Text("ddd"),
        ),
        child: Center(child: Icon(CupertinoIcons.share)),
      ),
    );


    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   home: MyHomePage(title: 'Flutter Demo Home Page'),
    // );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  final syncer = getIt.get<Syncer>();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            StreamBuilder<DateTime>(
                stream: syncer.stream,
                builder: (context, data) {
                  return Text(data.data.toString());
                },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
