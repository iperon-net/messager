import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:messenger/injection.dart';
import 'package:messenger/logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'cubit/common_cubit.dart';
import 'screens/auth_screen.dart';


var _redirect = (BuildContext context, GoRouterState state) async {
  context.read<CommonCubit>().connectivityListen();

  return;
};


GoRouter get router {
  Logger logger = getIt.get<Logger>();
  TalkerScreen talkerScreen = TalkerScreen(talker: logger.logger, appBarTitle: "Logger");

  return GoRouter(
    initialLocation: '/',
    redirect: _redirect,
    observers: [
      TalkerRouteObserver(logger.logger)
    ],
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const AuthScreen();
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

