import 'package:flutter/material.dart';
import 'package:supono/app/theme/app_text_style.dart';

class AppButtonWhite extends StatelessWidget {
  const AppButtonWhite({
    required this.title,
    required this.onPressed,
    super.key,
  });
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          overlayColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(
          title,
          style: AppTextStyle.black17w700,
        ),
      ),
    );
  }
}
