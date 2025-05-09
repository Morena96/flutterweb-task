import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supono/app/enums/onboarding.dart';
import 'package:supono/app/theme/app_colors.dart';
import 'package:supono/app/theme/app_text_style.dart';
import 'package:supono/app/widgets/app_back_button.dart';
import 'package:supono/app/widgets/app_close_button.dart';
import 'package:supono/app/widgets/app_next_button.dart';
import 'package:supono/screens/camera/cubit/user_form_cubit.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    required this.onboarding,
    this.body,
    this.footer,
    super.key,
  });

  final Onboarding onboarding;
  final Widget? body;
  final Widget? footer;

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
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xBF560DBE).withValues(alpha: 0.75),
                  const Color(0xBF10001B).withValues(alpha: 0.75),
                  const Color(0xBF10001B).withValues(alpha: 0.75),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
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
                Row(
                  children: [
                    if (onboarding != Onboarding.splash)
                      AppBackButton(onPressed: context.pop)
                    else
                      const AppCloseButton(),
                    const Spacer(),
                    if (onboarding != Onboarding.splash)
                      Stack(
                        children: [
                          SizedBox(
                            height: 44,
                            width: 44,
                            child: CircularProgressIndicator(
                              value: onboarding.percentage / 100,
                              strokeWidth: 1,
                              backgroundColor: Colors.grey,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                AppColors.white,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              child: Text(
                                '${onboarding.percentage}%',
                                style: AppTextStyle.grey14w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                const SizedBox(height: 50),
                Text(
                  onboarding.title(context),
                  style: AppTextStyle.white30w800,
                ),
                const SizedBox(height: 14),
                if (onboarding.subtitle(context) != null)
                  Text(
                    onboarding.subtitle(context)!,
                    style: AppTextStyle.grey2_15w500,
                  )
                else
                  const SizedBox(height: 4),
                const SizedBox(height: 40),
                if (body != null) body!,
              ],
            ),
          ),
          if (footer != null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: footer!,
            ),
          BlocBuilder<UserFormCubit, UserFormState>(
            builder: (context, state) {
              if (onboarding.isNextAvailable(state)) {
                return Positioned(
                  bottom: 20,
                  right: 25,
                  child: AppNextButton(
                    onPressed: () => onboarding.pushNext(context),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
