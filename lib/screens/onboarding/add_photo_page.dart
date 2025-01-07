import 'package:flutter/material.dart';
import 'package:supono/app/enums/onboarding.dart';
import 'package:supono/screens/onboarding/widgets/onboarding_widget.dart';

class AddPhotoPage extends StatelessWidget {
  const AddPhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingWidget(onboarding: Onboarding.addPhoto);
  }
}
