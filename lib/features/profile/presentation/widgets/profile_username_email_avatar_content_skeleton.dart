import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:meditation_app/core/themes/app_colors.dart';

class ProfileUsernameEmailAvatarContentSkeleton extends StatelessWidget {
  const ProfileUsernameEmailAvatarContentSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(
        baseColor: AppColors.grey300,
        highlightColor: AppColors.grey100,
      ),
      child: Column(
        children: [
          // Avatar Skeleton
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),

          const SizedBox(height: 8),

          // Username Skeleton
          Container(
            height: 20,
            width: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),

          const SizedBox(height: 6),

          // Email Skeleton
          Container(
            height: 14,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ],
      ),
    );
  }
}
