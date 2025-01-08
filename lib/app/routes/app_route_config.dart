import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supono/app/enums/onboarding.dart';
import 'package:supono/app/routes/app_route_constants.dart';
import 'package:supono/screens/camera/camera_page.dart';
import 'package:supono/screens/home/home_page.dart';
import 'package:supono/screens/settings/settings_page.dart';

class AppRouteConfig {
  static CustomTransitionPage<void> buildPageWithDefaultTransition<T>({
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );
  }

  static GoRouter returnRouter({bool isOnboardingCompleted = true}) {
    final router = GoRouter(
      initialLocation: isOnboardingCompleted
          ? AppRouteConstants.home
          : AppRouteConstants.addPhoto,
      routes: <GoRoute>[
        Onboarding.splash.route,
        Onboarding.birthday.route,
        Onboarding.nickname.route,
        Onboarding.gender.route,
        Onboarding.addPhoto.route,
        GoRoute(
          path: AppRouteConstants.camera,
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            state: state,
            child: CameraPage(state.extra! as CameraDescription),
          ),
        ),
        GoRoute(
          path: AppRouteConstants.home,
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            state: state,
            child: HomePage(state.extra! as XFile),
          ),
        ),
        GoRoute(
          path: AppRouteConstants.settings,
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            state: state,
            child: const SettingsPage(),
          ),
        ),
      ],
    );

    return router;
  }
}
