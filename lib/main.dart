import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_cubit.dart';
import 'injection.dart';
import 'routers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // Configure injection
  configureDependencies();

  await getIt.allReady();

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
      // BlocProvider(
      //   create: (_) => getIt.get<AuthCubit>(),
      // ),
    ],
    child: MaterialApp.router(
      title: 'Iperon',
      debugShowCheckedModeBanner: false,
      // theme: themeLight(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: router,
    ),
  );
}
