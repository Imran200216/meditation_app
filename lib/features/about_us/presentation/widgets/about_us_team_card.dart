import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meditation_app/common/widgets/k_text.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/features/profile/presentation/widgets/profile_avatar.dart';

class AboutUsTeamCard extends StatelessWidget {
  final String name;
  final String designation;
  final VoidCallback onTap;
  final String profileImage;

  const AboutUsTeamCard({
    super.key,
    required this.name,
    required this.designation,
    required this.onTap,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.heavyImpact();

        onTap();
      },
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.primaryColor.withOpacity(0.2),
        ),
        child: Row(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProfileAvatar(personImageUrl: profileImage, height: 60, width: 60),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Title
                  KText(
                    text: name,
                    softWrap: true,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    color: AppColors.titleColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),

                  // Sub Title
                  KText(
                    text: designation,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    color: AppColors.subTitleParaColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ],
              ),
            ),

            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.titleColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
