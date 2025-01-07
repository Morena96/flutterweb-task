import 'package:go_router/go_router.dart';
import 'package:supono/app/enums/onboarding.dart';
import 'package:supono/app/routes/app_route_constants.dart';
import 'package:supono/screens/camera/camera_page.dart';
import 'package:supono/screens/settings/settings_page.dart';

class AppRouteConfig {
  static GoRouter returnRouter({bool isOnboardingCompleted = true}) {
    final router = GoRouter(
      initialLocation: isOnboardingCompleted
          ? AppRouteConstants.camera
          : AppRouteConstants.splash,
      routes: <GoRoute>[
        OnboardingX.route,
        GoRoute(
          path: AppRouteConstants.camera,
          builder: (context, state) => const CameraPage(),
        ),
        GoRoute(
          path: AppRouteConstants.settings,
          builder: (context, state) => const SettingsPage(),
        ),
      ],
    );

    return router;
  }
}
