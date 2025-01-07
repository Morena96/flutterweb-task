import 'package:flutter/material.dart';
import 'package:supono/app/theme/app_colors.dart';

class AppDecoration {
  const AppDecoration._();

  static BoxDecoration get greyCircleBorder => BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.grey),
      );
}
