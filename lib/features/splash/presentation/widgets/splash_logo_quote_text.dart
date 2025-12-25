import 'package:flutter/material.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/common/widgets/widgets.dart';

class SplashLogoQuoteText extends StatelessWidget {
  final String text;

  const SplashLogoQuoteText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(backgroundColor: AppColors.subTitleColor, radius: 3),

        KText(
          text: text,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          maxLines: 1,
          textAlign: TextAlign.center,
          color: AppColors.subTitleColor,
        ),
      ],
    );
  }
}
