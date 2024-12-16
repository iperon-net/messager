import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:messenger/injection.dart';
import 'package:messenger/logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'screens/auth_screen.dart';

GoRouter get router {
  Logger logger = getIt.get<Logger>();
  TalkerScreen talkerScreen = TalkerScreen(talker: logger.logger, appBarTitle: "Logger");

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
        routes: <RouteBase>[
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

