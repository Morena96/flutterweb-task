import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:supono/app/theme/app_decoration.dart';

class AppCloseButton extends StatelessWidget {
  const AppCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: SystemNavigator.pop,
      child: Container(
        height: 44,
        width: 44,
        alignment: Alignment.center,
        decoration: AppDecoration.greyCircleBorder,
        child: SvgPicture.asset('assets/icons/close.svg'),
      ),
    );
  }
}
