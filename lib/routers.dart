import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:messenger/injection.dart';
import 'package:messenger/logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'cubit/auth_confirmation_cubit.dart';
import 'cubit/auth_cubit.dart';
import 'cubit/common_cubit.dart';
import 'screens/auth_confirmation.dart';
import 'screens/auth_screen.dart';
import 'screens/common_screen.dart';


var _redirect = (BuildContext context, GoRouterState state) async {
  context.read<CommonCubit>().connectivityListen();

  return;
};


GoRouter get router {
  Logger logger = getIt.get<Logger>();
  TalkerScreen talkerScreen = TalkerScreen(talker: logger.logger, appBarTitle: "Logger");

  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  return GoRouter(
    initialLocation: "/auth",
    redirect: _redirect,
    observers: <NavigatorObserver>[
      TalkerRouteObserver(logger.logger),
      FirebaseAnalyticsObserver(analytics: analytics),
    ],
    routes: <RouteBase>[
      GoRoute(
        path: "/auth",
        name: "auth",
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            lazy: true,
            create: (context) => AuthCubit(),
            child: const AuthScreen(),
          );
        },
        routes: <RouteBase>[
          GoRoute(
            path: "/confirmation/:signInToken",
            name: "auth_confirmation",
            builder: (BuildContext context, GoRouterState state) {
              if(!state.pathParameters.containsKey("signInToken")) return CommonScreen().notImplemented();

              String signInToken = state.pathParameters.values.elementAt(0);

              return BlocProvider(
                lazy: true,
                create: (context) => AuthConfirmationCubit(),
                child: AuthConfirmationScreen(signInToken: signInToken),
              );
            },
          ),
          GoRoute(
            path: "/logger_monitor",
            name: "logger_monitor",
            builder: (BuildContext context, GoRouterState state) => talkerScreen,
          ),
        ],
      ),
    ],
  );

}

