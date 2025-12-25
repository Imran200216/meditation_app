import 'package:flutter/material.dart';
import 'package:meditation_app/common/widgets/widgets.dart';
import 'package:meditation_app/core/themes/app_colors.dart';

class LanguageSelectScreen extends StatelessWidget {
  const LanguageSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Title
            KText(
              maxLines: 1,
              softWrap: true,
              text: "What time would you like to mediate?",
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: AppColors.titleColor,
            ),
          ],
        ),
      ),
    );
  }
}
