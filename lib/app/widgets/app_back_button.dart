import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:supono/app/theme/app_decoration.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    required this.onPressed,
    this.icon,
    super.key,
  });

  final VoidCallback onPressed;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 44,
        width: 44,
        alignment: Alignment.center,
        decoration: AppDecoration.greyCircleBorder,
        child: SvgPicture.asset(icon ?? 'assets/icons/back.svg'),
      ),
    );
  }
}
