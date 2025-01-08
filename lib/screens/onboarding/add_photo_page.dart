import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:supono/app/enums/onboarding.dart';
import 'package:supono/app/theme/app_decoration.dart';
import 'package:supono/app/theme/app_text_style.dart';
import 'package:supono/app/widgets/app_button_white.dart';
import 'package:supono/l10n/l10n.dart';
import 'package:supono/screens/onboarding/widgets/onboarding_widget.dart';

class AddPhotoPage extends StatelessWidget {
  const AddPhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingWidget(
      onboarding: Onboarding.addPhoto,
      body: Column(
        children: [
          AppButtonWhite(
            title: context.l10n.takeYourFirstPhoto,
            onPressed: () {},
          ),
          const SizedBox(height: 50),
          Container(
            decoration: AppDecoration.greyBorder15,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.makeSureThatYourImage,
                  style: AppTextStyle.white20w800,
                ),
                const SizedBox(height: 10),
                tiles(context.l10n.showsYourFaceClearly),
                tiles(context.l10n.yourselfOnly),
                tiles(context.l10n.noFakePic),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row tiles(String title) {
    return Row(
      children: [
        SvgPicture.asset('assets/icons/tick.svg'),
        const SizedBox(width: 6),
        Text(
          title,
          style: AppTextStyle.grey16w400,
        ),
      ],
    );
  }
}
