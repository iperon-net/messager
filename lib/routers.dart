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
    ],
  );

}

