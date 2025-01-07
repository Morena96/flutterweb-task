import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:supono/app/routes/app_route_constants.dart';
import 'package:supono/l10n/l10n.dart';
import 'package:supono/screens/onboarding/add_photo_page.dart';
import 'package:supono/screens/onboarding/birthday_page.dart';
import 'package:supono/screens/onboarding/gender_page.dart';
import 'package:supono/screens/onboarding/nickname_page.dart';
import 'package:supono/screens/onboarding/splash_page.dart';

enum Onboarding { splash, birthday, nickname, gender, addPhoto }

extension OnboardingX on Onboarding {
  String title(BuildContext context) {
    switch (this) {
      case Onboarding.birthday:
        return context.l10n.whensYourBirthday;
      case Onboarding.nickname:
        return context.l10n.chooseYourNickname;
      case Onboarding.addPhoto:
        return context.l10n.takeYourFirstPhoto;
      case Onboarding.gender:
        return context.l10n.whichGenderDoYou;
      case Onboarding.splash:
        return '';
    }
  }

  String? subtitle(BuildContext context) {
    if (this case Onboarding.gender) {
      return context.l10n.whichGenderDoYouSubtitle;
    } else {
      return null;
    }
  }

  String get path {
    switch (this) {
      case Onboarding.splash:
        return AppRouteConstants.splash;
      case Onboarding.birthday:
        return AppRouteConstants.birthday;
      case Onboarding.nickname:
        return AppRouteConstants.nickname;
      case Onboarding.addPhoto:
        return AppRouteConstants.addPhoto;
      case Onboarding.gender:
        return AppRouteConstants.gender;
    }
  }

  String get image {
    switch (this) {
      case Onboarding.splash:
        return 'assets/images/onboarding/splash.png';
      case Onboarding.birthday:
        return 'assets/images/onboarding/birthday.png';
      case Onboarding.nickname:
        return 'assets/images/onboarding/nickname.png';
      case Onboarding.addPhoto:
        return 'assets/images/onboarding/add_photo.png';
      case Onboarding.gender:
        return 'assets/images/onboarding/gender.png';
    }
  }

  Widget get page {
    switch (this) {
      case Onboarding.splash:
        return const SplashPage();
      case Onboarding.birthday:
        return const BirthdayPage();
      case Onboarding.nickname:
        return const NicknamePage();
      case Onboarding.addPhoto:
        return const AddPhotoPage();
      case Onboarding.gender:
        return const GenderPage();
    }
  }

  static GoRoute get route {
    final onboardingSteps = [
      Onboarding.splash,
      Onboarding.birthday,
      Onboarding.nickname,
      Onboarding.gender,
      Onboarding.addPhoto,
    ];

    GoRoute createRoute(Onboarding step, List<Onboarding> remainingSteps) {
      if (remainingSteps.isEmpty) {
        return GoRoute(
          path: step.path,
          builder: (context, state) => step.page,
        );
      } else {
        return GoRoute(
          path: step.path,
          builder: (context, state) => step.page,
          routes: [
            createRoute(remainingSteps.first, remainingSteps.sublist(1)),
          ],
        );
      }
    }

    return createRoute(onboardingSteps.first, onboardingSteps.sublist(1));
  }
}
