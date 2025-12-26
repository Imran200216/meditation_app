import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/core/constants/constants.dart';

class YogaLevelSubTitleCard extends StatelessWidget {
  final String title;
  final String benefits;
  final String imageUrl;
  final VoidCallback onTap;
  final String duration;

  const YogaLevelSubTitleCard({
    super.key,
    required this.title,
    required this.benefits,
    required this.onTap,
    required this.duration,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.heavyImpact();

        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.subTitleColor.withOpacity(0.3),
            width: 0.5,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🖼 IMAGE (NOW HEIGHT WORKS)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 90,
                height: 96,
                // ✅ Increase freely
                fit: BoxFit.cover,
                placeholder: (context, url) => Image.asset(
                  AppAssetsConstants.imgPlaceholder,
                  fit: BoxFit.cover,
                ),
                errorWidget: (context, url, error) => Image.asset(
                  AppAssetsConstants.imgPlaceholder,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(width: 12),

            /// 📄 TEXT CONTENT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: AppColors.titleColor,
                      fontFamily: "GoogleSans",
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    benefits,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.subTitleParaColor,
                      fontFamily: "GoogleSans",
                    ),
                  ),
                ],
              ),
            ),

            /// ⏱ DURATION CHIP
            Chip(
              label: Text(
                duration,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              backgroundColor: AppColors.primaryColor.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8),
            ),
          ],
        ),
      ),
    );
  }
}
