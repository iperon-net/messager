import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'screens/auth/auth_cubit.dart';
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
          return BlocProvider(
            create: (BuildContext context) => AuthCubit(),
            child: const AuthScreen(),
          );
        }
      ),
    ]
  );
}
