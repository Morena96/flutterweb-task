import 'package:flutter/material.dart';
import 'package:supono/app/theme/app_colors.dart';

class AppDecoration {
  const AppDecoration._();

  static BoxDecoration get whiteCircleBorder => BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
        border: Border.all(width: 2),
      );

  static BoxDecoration get greyCircleBorder => BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.grey),
      );

  static BoxDecoration get greyBorder15 => BoxDecoration(
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(15),
      );

  static InputDecoration get inputDecoration => InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(22, 15, 22, 18),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
      );
}
