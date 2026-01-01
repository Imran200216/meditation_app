import 'package:flutter/material.dart';
import 'package:meditation_app/core/themes/app_colors.dart';

class MeditateAudioCardSkeleton extends StatelessWidget {
  const MeditateAudioCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Skeleton for Audio Card
        Container(
          height: 180,
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.subTitleColor.withOpacity(0.2),
          ),
        ),

        const SizedBox(height: 10),

        // Skeleton for Title
        Container(
          height: 20,
          width: 120,
          decoration: BoxDecoration(
            color: AppColors.subTitleColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}
