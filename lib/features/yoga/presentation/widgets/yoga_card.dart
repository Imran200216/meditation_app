import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meditation_app/common/widgets/k_text.dart';
import 'package:meditation_app/core/constants/app_assets_constants.dart';
import 'package:meditation_app/core/themes/app_colors.dart';

class YogaCard extends StatelessWidget {
  final String yogaLevel;
  final String yogaDescription;
  final String timeTaken;
  final String imageUrl;
  final VoidCallback onTap;

  const YogaCard({
    super.key,
    required this.onTap,
    required this.yogaLevel,
    required this.yogaDescription,
    required this.timeTaken,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Haptics
        HapticFeedback.heavyImpact();

        onTap();
      },
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              // Background Image
              CachedNetworkImage(
                imageUrl: imageUrl,
                width: double.infinity,
                height: double.infinity,
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

              // Gradient Overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.65),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Level Chip
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: KText(
                        text: yogaLevel,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.bgColor,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Description
                    KText(
                      maxLines: 2,
                      text: yogaDescription,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: AppColors.bgColor,
                    ),

                    const SizedBox(height: 6),

                    Row(
                      children: [
                        const Icon(
                          Icons.alarm_rounded,
                          size: 18,
                          color: Colors.white70,
                        ),
                        const SizedBox(width: 6),
                        KText(
                          text: timeTaken,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
