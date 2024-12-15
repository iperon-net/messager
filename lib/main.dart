import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger/logger.dart';
import 'package:messenger/utils.dart';

import 'cubit/counter_cubit.dart';
import 'db/db.dart';
import 'db/models_db.dart' as models_db;
import 'injection.dart';
import 'routers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // Configure injection
  configureDependencies();

  await getIt.allReady();

  Logger logger = getIt.get<Logger>();

  VersionDB db = getIt.get<VersionDB>();
  models_db.VersionDB response = await db.version();
  logger.debug("sqlite version:${response.version}");


  // Run app
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ru', 'RU'),
      ],
      path: 'assets/translations',
      saveLocale: true,
      fallbackLocale: const Locale('en', 'US'),
      child: const IperonApp(),
    ),
  );
}

class IperonApp extends StatelessWidget {
  const IperonApp({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => getIt.get<CounterCubit>(),
      ),
    ],
    child: getAppPlatform(context),
  );
}


Widget getAppPlatform(BuildContext context) {
  Utils utils = getIt.get<Utils>();

  if (utils.getPlatform == SystemPlatform.ios) {
    return getAppIos(context);
  } else if (utils.getPlatform == SystemPlatform.android) {
    return getAppAndroid(context);
  }
  throw Exception("Not found platform");

}

Widget getAppIos(BuildContext context) {
  Utils utils = getIt.get<Utils>();

  return CupertinoApp.router(
    title: 'Iperon',
    debugShowCheckedModeBanner: utils.isDebug ? true : false,
    // theme: themeLight(),
    localizationsDelegates: context.localizationDelegates,
    supportedLocales: context.supportedLocales,
    locale: context.locale,
    routerConfig: router,
  );
}

Widget getAppAndroid(BuildContext context) {
  Utils utils = getIt.get<Utils>();

  return MaterialApp.router(
    title: 'Iperon',
    debugShowCheckedModeBanner: utils.isDebug ? true : false,
    // theme: themeLight(),
    localizationsDelegates: context.localizationDelegates,
    supportedLocales: context.supportedLocales,
    locale: context.locale,
    routerConfig: router,
  );
}
