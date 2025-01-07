import 'package:flutter/material.dart';
import 'package:supono/app/enums/onboarding.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget(this.onboarding, {super.key});

  final Onboarding onboarding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(onboarding.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 25,
            right: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  onboarding.title(context),
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (onboarding.subtitle(context) != null)
                  Text(onboarding.subtitle(context)!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
