import 'package:dibasys_project/@core/router/routenames.dart';
import 'package:dibasys_project/presentation/views/dashboard/dashboard_main.dart';

import 'package:dibasys_project/presentation/views/login/login.dart';
import 'package:dibasys_project/presentation/views/manualcheckin/manual_checkin.dart';
import 'package:dibasys_project/presentation/views/register/registerscreen.dart';
import 'package:dibasys_project/presentation/views/splash/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: RouteNames.splash,
        name: 'splash',

        // builder: (context, state) {
        //   // var input = state.uri.queryParameters['input'];
        //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        //     var redirect = state.uri.queryParameters['redirect'];
        //     // context.read<AuthController>().redirect = redirect ?? '';
        //   });
        //   return SplashScreen(key: state.pageKey);
        // },
        pageBuilder: (context, state) {
          return RouterTransitionFactory.getTransitionPage(
            context: context,
            state: state,
            child: SplashScreen(),
            type: 'scale',
          );
        },
      ),
      GoRoute(
        path: RouteNames.login,
        name: 'authenticate',
        // builder: (context, state) {
        //   // var input = state.uri.queryParameters['input'];
        //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        //     var redirect = state.uri.queryParameters['redirect'];
        //     // context.read<AuthController>().redirect = redirect ?? '';
        //   });
        //   return LoginScreen(key: state.pageKey);
        // },
        pageBuilder: (context, state) {
          return RouterTransitionFactory.getTransitionPage(
            context: context,
            state: state,
            child: LoginScreen(),
            type: 'scale',
          );
        },
      ),
      GoRoute(
        path: RouteNames.dashboard,
        name: 'dashboard',

        pageBuilder: (context, state) {
          return RouterTransitionFactory.getTransitionPage(
            context: context,
            state: state,
            child: Dashboard(),
            type: 'scale',
          );
        },
      ),
      GoRoute(
        path: RouteNames.checkInScreen,
        name: 'checkinccreen',

        pageBuilder: (context, state) {
          return RouterTransitionFactory.getTransitionPage(
            context: context,
            state: state,
            child: CheckInScreen(),
            type: 'scale',
          );
        },
      ),

      GoRoute(
        path: RouteNames.registration,
        name: 'registration',

        pageBuilder: (context, state) {
          return RouterTransitionFactory.getTransitionPage(
            context: context,
            state: state,
            child: RegisterScreen(),
            type: 'scale',
          );
        },
      ),
    ],
  );

  CustomTransitionPage buildFadeAnimatedPage<T>({
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage(
      child: child,
      key: state.pageKey,
      transitionsBuilder: (context, animation, animation2, child2) =>
          FadeTransition(opacity: animation, child: child2),
    );
  }
}

class RouterTransitionFactory {
  static CustomTransitionPage getTransitionPage({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
    required String type,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (type) {
          case 'fade':
            return FadeTransition(opacity: animation, child: child);
          case 'rotation':
            return RotationTransition(turns: animation, child: child);
          case 'size':
            return SizeTransition(sizeFactor: animation, child: child);
          case 'scale':
            return ScaleTransition(scale: animation, child: child);
          default:
            return FadeTransition(opacity: animation, child: child);
        }
      },
    );
  }
}
