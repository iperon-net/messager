import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'contrib/di.dart';
import 'contrib/logger.dart';
import 'screens/auth/auth_screen.dart';

GoRouter get router {

  return GoRouter(
    initialLocation: "/auth",
    // observers: <NavigatorObserver>[
    //   TalkerRouteObserver(logger.talker),
    //   FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
    // ],
    routes: <RouteBase>[
      GoRoute(
        path: "/auth",
        name: "auth",
        // redirect: middlewareAuth,
        builder: (BuildContext context, GoRouterState state) {
          return const AuthScreen();
        },
      ),
    ]
  );

}
