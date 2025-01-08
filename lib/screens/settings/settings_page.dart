import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:supono/app/theme/app_colors.dart';
import 'package:supono/app/theme/app_text_style.dart';
import 'package:supono/app/widgets/app_back_button.dart';
import 'package:supono/l10n/l10n.dart';
import 'package:supono/screens/camera/cubit/user_form_cubit.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _inAppReview = InAppReview.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBackButton(onPressed: context.pop),
            const SizedBox(height: 30),
            Text(
              context.l10n.settings,
              style: AppTextStyle.grey13w500,
            ),
            const SizedBox(height: 7),
            Container(
              decoration: BoxDecoration(
                color: AppColors.grey3,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  listTile(title: context.l10n.unlockApp, onTap: () {}),
                  const Divider(color: AppColors.dividerColor),
                  listTile(
                    title: context.l10n.rateUs,
                    onTap: _inAppReview.requestReview,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              context.l10n.myAccount,
              style: AppTextStyle.grey13w500,
            ),
            const SizedBox(height: 7),
            BlocBuilder<UserFormCubit, UserFormState>(
              builder: (context, state) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.grey3,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      listTile(
                        title: context.l10n.username,
                        trailing: state.user.nickname,
                        onTap: () {},
                      ),
                      const Divider(
                        color: AppColors.dividerColor,
                        height: 1,
                      ),
                      listTile(
                        title: context.l10n.birthday,
                        trailing: state.user.birthdayString,
                        onTap: () {},
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  ListTile listTile(
      {required String title, required VoidCallback onTap, String? trailing}) {
    return ListTile(
      title: Text(
        title,
        style: AppTextStyle.white16w600,
      ),
      onTap: onTap,
      trailing: trailing == null
          ? null
          : Text(trailing, style: AppTextStyle.grey15w600),
    );
  }
}
