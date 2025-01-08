import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supono/app/enums/gender.dart';
import 'package:supono/app/enums/onboarding.dart';
import 'package:supono/app/theme/app_decoration.dart';
import 'package:supono/app/theme/app_text_style.dart';
import 'package:supono/screens/camera/cubit/user_form_cubit.dart';
import 'package:supono/screens/onboarding/widgets/onboarding_widget.dart';

class GenderPage extends StatelessWidget {
  const GenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingWidget(
      onboarding: Onboarding.gender,
      body: Column(
        children: Gender.values
            .map(
              (gender) => Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: GestureDetector(
                  onTap: () {
                    context.read<UserFormCubit>().genderChanged(gender);
                    Onboarding.gender.pushNext(context);
                  },
                  child: Container(
                    height: 67,
                    width: double.infinity,
                    decoration: AppDecoration.greyBorder15,
                    alignment: Alignment.center,
                    child: Text(
                      gender.title(context),
                      style: AppTextStyle.white23w800,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
