import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:supono/app/routes/app_route_config.dart';
import 'package:supono/app/routes/app_route_constants.dart';
import 'package:supono/l10n/l10n.dart';
import 'package:supono/screens/camera/cubit/user_form_cubit.dart';
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
        return context.l10n.addNicePhoto;
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

  int get percentage =>
      ((100 / (Onboarding.values.length - 1)) * index).round();

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

  GoRoute get route => GoRoute(
        path: path,
        pageBuilder: (context, state) =>
            AppRouteConfig.buildPageWithDefaultTransition<void>(
          state: state,
          child: page,
        ),
      );

  void pushNext(BuildContext context) {
    final nextIndex = index + 1;
    if (nextIndex < Onboarding.values.length) {
      final nextStep = Onboarding.values[nextIndex];
      context.push(nextStep.path);
    }
  }

  bool isNextAvailable(UserFormState state) {
    switch (this) {
      case Onboarding.splash:
        return false;
      case Onboarding.birthday:
        return state.isBirthdayValid;
      case Onboarding.nickname:
        return state.isNicknameValid;
      case Onboarding.gender:
        return false;
      case Onboarding.addPhoto:
        return false;
    }
  }
}
