import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'package:supono/app/theme/app_decoration.dart';

class AppNextButton extends StatelessWidget {
  const AppNextButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 50,
        alignment: Alignment.center,
        decoration: AppDecoration.whiteCircleBorder,
        child: SvgPicture.asset('assets/icons/forward.svg'),
      ),
    );
  }
}
