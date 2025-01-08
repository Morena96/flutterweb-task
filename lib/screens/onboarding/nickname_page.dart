import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supono/app/enums/onboarding.dart';
import 'package:supono/app/theme/app_decoration.dart';
import 'package:supono/screens/camera/cubit/user_form_cubit.dart';
import 'package:supono/screens/onboarding/widgets/onboarding_widget.dart';

class NicknamePage extends StatelessWidget {
  const NicknamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingWidget(
      onboarding: Onboarding.nickname,
      body: Column(
        children: [
          TextField(
            decoration: AppDecoration.inputDecoration,
            onChanged: (value) =>
                context.read<UserFormCubit>().nicknameChanged(value),
          ),
        ],
      ),
    );
  }
}
