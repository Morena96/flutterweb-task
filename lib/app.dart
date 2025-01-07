import 'package:flutter/material.dart';
import 'package:supono/app/routes/app_route_config.dart';
import 'package:supono/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouteConfig.returnRouter(isOnboardingCompleted: false);

    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
