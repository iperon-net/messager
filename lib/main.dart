import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger/utils.dart';

import 'constants.dart';
import 'cubit/common_cubit.dart';
import 'cubit/debug_cubit.dart';
import 'injection.dart';
import 'routers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  // Configure injection
  configureDependencies();

  await getIt.allReady();


  // await getIt.get<UsersDB>().createOrUpdate(
  //     user: const modeldb.Users(
  //       userId: "123456",
  //       email: "user@yandex.ru",
  //       accessToken: "accessToken",
  //       refreshToken: "refreshToken",
  //       expirationTime: 1234567890,
  //   )
  // );
  // PackageInformation packageInformation = await getIt.get<Utils>().packageInformation();

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
        create: (_) => getIt.get<DebugCubit>(),
      ),
      BlocProvider(
        create: (_) => getIt.get<CommonCubit>(),
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
    theme: const CupertinoThemeData(
      primaryColor: Color(0xFF715D00),
    ),
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
    themeMode: ThemeMode.light,
    theme: ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.appBarBackgroundColor,
        foregroundColor: AppColors.appBarForegroundColor,
      ),
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        labelStyle: TextStyle(
          color: AppColors.primaryColor,
        ),
        // isDense: true,
        contentPadding: EdgeInsets.all(12),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.primaryColor,
        selectedLabelStyle: TextStyle(fontSize: 12),
        unselectedLabelStyle: TextStyle(fontSize: 12),
      ),
      listTileTheme: const ListTileThemeData(
        selectedColor: AppColors.primaryColor,
      ),
    ),
  );
}
