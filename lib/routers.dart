import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'contrib/di.dart';
import 'contrib/logger.dart';
import 'screens/auth/auth_confirmation_cubit.dart';
import 'screens/auth/auth_confirmation_screen.dart';
import 'screens/auth/auth_cubit.dart';
import 'screens/auth/auth_screen.dart';
import 'screens/home/home_cubit.dart';
import 'screens/home/home_screen.dart';
import 'services/services.dart';

GoRouter get router {
  final logger = getIt.get<Logger>();
  final services = getIt.get<Services>();

  return GoRouter(
      initialLocation: "/home",
      // observers: <NavigatorObserver>[
      //   TalkerRouteObserver(logger.talker),
      //   FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
      // ],
      routes: <RouteBase>[
        GoRoute(
          path: "/auth",
          name: "auth",
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (BuildContext context) => AuthCubit(),
              child: const AuthScreen(),
            );
          },
          routes: [
            GoRoute(
              path: "/confirmation/:signInToken",
              name: "authConfirmation",
              builder: (BuildContext context, GoRouterState state) {
                return BlocProvider(
                  create: (BuildContext context) => AuthConfirmationCubit(),
                  child: const AuthConfirmationScreen(),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: "/home",
          name: "home",
          redirect: (BuildContext context, GoRouterState state) async {

            final user = await services.users.getActive();
            if(user.isActive == 0) return "/auth";

            return null;
          },
          builder: (BuildContext context, GoRouterState state) {
            final homeCubit = HomeCubit();
            homeCubit.startup();

            return BlocProvider(
              create: (BuildContext context) => homeCubit,
              child: const HomeScreen(),
            );
          },
        ),
      ]);
}
