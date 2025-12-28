import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:meditation_app/common/widgets/k_text.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/features/profile/presentation/widgets/profile_avatar.dart';

class ProfileUsernameEmailAvatarContent extends StatelessWidget {
  final String profileAvatarImageUrl;
  final String userName;
  final String userEmailAddress;

  const ProfileUsernameEmailAvatarContent({
    super.key,
    required this.profileAvatarImageUrl,
    required this.userName,
    required this.userEmailAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Avatar
        ProfileAvatar(
              personImageUrl: profileAvatarImageUrl,
              height: 100,
              width: 100,
            )
            .animate()
            .fadeIn(duration: 700.ms)
            .scale(
              begin: const Offset(0.85, 0.85),
              end: const Offset(1, 1),
              duration: 700.ms,
              curve: Curves.easeOutCubic,
            ),

        const SizedBox(height: 8),

        // Title
        KText(
              text: userName,
              softWrap: true,
              maxLines: 2,
              textAlign: TextAlign.center,
              color: AppColors.titleColor,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            )
            .animate()
            .fadeIn(duration: 600.ms, delay: 200.ms)
            .slideY(
              begin: -0.25,
              end: 0,
              duration: 600.ms,
              curve: Curves.easeOut,
            ),

        const SizedBox(height: 3),

        // Sub Title
        KText(
              text: userEmailAddress,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.subTitleColor,
            )
            .animate()
            .fadeIn(duration: 600.ms, delay: 300.ms)
            .slideY(begin: -0.2, end: 0, duration: 600.ms),
      ],
    );
  }
}
