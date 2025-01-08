import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supono/app/injection/injection.dart';
import 'package:supono/app/routes/app_route_config.dart';
import 'package:supono/app/theme/app_text_style.dart';
import 'package:supono/data/network/user.dart';
import 'package:supono/l10n/l10n.dart';
import 'package:supono/screens/camera/cubit/user_form_cubit.dart';

class App extends StatelessWidget {
  const App(this.user, {super.key});

  final User? user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserFormCubit>(),
      child: MaterialAppWidget(isAuthorized: user != null),
    );
  }
}

class MaterialAppWidget extends StatelessWidget {
  const MaterialAppWidget({required this.isAuthorized, super.key});

  final bool isAuthorized;

  @override
  Widget build(BuildContext context) {
    final router =
        AppRouteConfig.returnRouter(isOnboardingCompleted: isAuthorized);

    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyLarge: AppTextStyle.white25w800,
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
