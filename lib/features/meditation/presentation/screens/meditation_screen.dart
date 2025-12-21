import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:meditation_app/commons/widgets/k_text.dart';
import 'package:meditation_app/core/themes/app_colors.dart';

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Title
              KText(
                    maxLines: 2,
                    softWrap: true,
                    text: "Meditate",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: AppColors.titleColor,
                  )
                  .animate()
                  .fadeIn(delay: 40.ms, curve: Curves.easeIn)
                  .slideY(begin: -0.5, end: 0),

              const SizedBox(height: 12),

              // Sub Title
              KText(
                    maxLines: 2,
                    softWrap: true,
                    text:
                        "we can learn how to recognize when our minds are doing their normal everyday acrobatics.",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: AppColors.subTitleColor,
                  )
                  .animate()
                  .fadeIn(delay: 80.ms, curve: Curves.easeIn)
                  .slideY(begin: -0.5, end: 0),
            ],
          ),
        ),
      ),
    );
  }
}
