import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/commons/widgets/k_text.dart';
import 'package:meditation_app/core/constants/app_assets_constants.dart';
import 'package:meditation_app/core/themes/app_colors.dart';

class MeditateAudioCard extends StatelessWidget {
  final String audioTitle;
  final VoidCallback onTap;

  const MeditateAudioCard({
    super.key,
    required this.audioTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        onTap();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Audio Card
          Container(
            height: 180,
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.primaryColor.withOpacity(0.3),
            ),
            child: Center(
              child: SvgPicture.asset(
                AppAssetsConstants.audio,
                height: 80,
                fit: BoxFit.cover,
                color: AppColors.titleColor,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Title
          KText(
            maxLines: 2,
            softWrap: true,
            text: audioTitle,
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: AppColors.titleColor,
          ),
        ],
      ),
    );
  }
}
