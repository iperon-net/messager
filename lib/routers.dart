import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:messenger/injection.dart';
import 'package:messenger/logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'screens/auth_screen.dart';

GoRouter get router {
  Logger logger = getIt.get<Logger>();

  return GoRouter(
    initialLocation: '/',
    observers: [
      TalkerRouteObserver(logger.logger)
    ],
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return AuthScreen();
        },
      ),
      GoRoute(
        path: "/logger_monitor",
        name: "logger_monitor",
        builder: (BuildContext context, GoRouterState state) {
          Logger logger = getIt.get<Logger>();
          return TalkerScreen(
            talker: logger.logger,
            appBarTitle: "Logger",
            // theme: TalkerScreenTheme(
            //   cardColor: Colors.grey[700]!,
            //   backgroundColor: Colors.grey[800]!,
            //   textColor: Colors.white,
            //   logColors: {
            //     /// Your logs colors...
            //   },
            // ),
          );
        },
      ),

    ],
  );

}

