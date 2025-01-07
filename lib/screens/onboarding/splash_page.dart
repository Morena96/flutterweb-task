import 'package:flutter/material.dart';
import 'package:supono/app/enums/onboarding.dart';
import 'package:supono/screens/onboarding/widgets/onboarding_widget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingWidget(Onboarding.splash);
  }
}
