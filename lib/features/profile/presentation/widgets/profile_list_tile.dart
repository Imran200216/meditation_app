import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/core/themes/app_colors.dart';

class ProfileListTile extends StatelessWidget {
  final String leadingSvgPath;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const ProfileListTile({
    super.key,
    required this.leadingSvgPath,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: AppColors.transparentColor,
      hoverColor: AppColors.transparentColor,
      focusColor: AppColors.transparentColor,
      tileColor: AppColors.transparentColor,

      onTap: () {
        HapticFeedback.heavyImpact();

        onTap();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          width: 0.8,
          color: AppColors.subTitleColor.withOpacity(0.2),
        ),
      ),
      leading: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.primaryColor.withOpacity(0.15),
        ),
        child: Center(
          child: SvgPicture.asset(
            height: 24,
            leadingSvgPath,
            color: AppColors.primaryColor,
          ),
        ),
      ),

      title: Text(title),
      titleTextStyle: TextStyle(
        color: AppColors.titleColor,
        fontWeight: FontWeight.w600,
        fontFamily: "GoogleSans",
        fontSize: 18,
      ),

      subtitle: Text(subtitle),
      subtitleTextStyle: TextStyle(
        color: AppColors.subTitleColor,
        fontWeight: FontWeight.w500,
        fontFamily: "GoogleSans",
        fontSize: 14,
      ),

      trailing: Icon(
        Icons.arrow_forward_ios,
        color: AppColors.titleColor,
        size: 17,
      ),
    );
  }
}
