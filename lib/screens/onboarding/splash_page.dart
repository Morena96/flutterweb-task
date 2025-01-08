import 'package:flutter/material.dart';
import 'package:supono/app/enums/onboarding.dart';
import 'package:supono/app/theme/app_colors.dart';
import 'package:supono/app/theme/app_text_style.dart';
import 'package:supono/app/widgets/app_button_white.dart';
import 'package:supono/l10n/l10n.dart';
import 'package:supono/screens/onboarding/widgets/onboarding_widget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingWidget(
      onboarding: Onboarding.splash,
      footer: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
        decoration: const BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.l10n.areYourReadyForTheTest,
              style: AppTextStyle.white25w800,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              context.l10n.startNowByCreating,
              style: AppTextStyle.grey14w600,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            AppButtonWhite(
              title: context.l10n.continueT,
              onPressed: () => Onboarding.splash.pushNext(context),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
