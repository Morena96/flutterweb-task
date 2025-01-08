import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supono/app/enums/onboarding.dart';
import 'package:supono/app/theme/app_decoration.dart';
import 'package:supono/app/theme/app_text_style.dart';
import 'package:supono/l10n/l10n.dart';
import 'package:supono/screens/camera/cubit/user_form_cubit.dart';
import 'package:supono/screens/onboarding/widgets/onboarding_widget.dart';

class BirthdayPage extends StatelessWidget {
  const BirthdayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFormCubit, UserFormState>(
      builder: (context, state) {
        return OnboardingWidget(
          onboarding: Onboarding.birthday,
          body: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 74,
                    child: Column(
                      children: [
                        TextField(
                          decoration: AppDecoration.inputDecoration,
                          onChanged: (value) {
                            context
                                .read<UserFormCubit>()
                                .birthdayChanged(value);
                          },
                        ),
                        const SizedBox(height: 5),
                        Text(
                          context.l10n.day,
                          style: AppTextStyle.grey16w400,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 74,
                    child: Column(
                      children: [
                        TextField(
                          decoration: AppDecoration.inputDecoration,
                          onChanged: (value) {
                            context
                                .read<UserFormCubit>()
                                .birthMonthChanged(value);
                          },
                        ),
                        const SizedBox(height: 5),
                        Text(
                          context.l10n.month,
                          style: AppTextStyle.grey16w400,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 103,
                    child: Column(
                      children: [
                        TextField(
                          style: AppTextStyle.white25w800,
                          decoration: AppDecoration.inputDecoration,
                          onChanged: (value) {
                            context
                                .read<UserFormCubit>()
                                .birthYearChanged(value);
                          },
                        ),
                        const SizedBox(height: 5),
                        Text(
                          context.l10n.year,
                          style: AppTextStyle.grey16w400,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
