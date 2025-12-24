import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meditation_app/core/themes/app_colors.dart';

class AudioLeadingTrailingIconBtn extends StatelessWidget {
  final Color iconColor;
  final IconData icon;
  final Color bgColor;
  final VoidCallback onTap;

  const AudioLeadingTrailingIconBtn({
    super.key,
    required this.iconColor,
    required this.icon,
    required this.onTap, required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.heavyImpact();

        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.subTitleColor, width: 0.4),
        ),
        child: CircleAvatar(
          radius: 24,
          backgroundColor: bgColor,
          child: Icon(icon, size: 24, color: iconColor),
        ),
      ),
    );
  }
}
