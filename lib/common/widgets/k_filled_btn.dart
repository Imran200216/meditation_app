import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meditation_app/common/widgets/k_text.dart';
import 'package:meditation_app/core/themes/app_colors.dart';

class KFilledBtn extends StatelessWidget {
  final String btnTitle;
  final Color btnBgColor;
  final Color btnTitleColor;
  final VoidCallback onTap;
  final bool isLoading;
  final double borderRadius;
  final double fontSize;
  final double btnHeight;
  final double btnWidth;

  const KFilledBtn({
    super.key,
    required this.btnTitle,
    required this.btnBgColor,
    required this.btnTitleColor,
    required this.onTap,
    this.isLoading = false,
    required this.borderRadius,
    required this.fontSize,
    required this.btnHeight,
    required this.btnWidth,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: isLoading
            ? null
            : () {
                HapticFeedback.heavyImpact();
                onTap();
              },
        child: Container(
          height: btnHeight,
          width: btnWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: btnBgColor,
          ),
          child: Center(
            child: isLoading
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator.adaptive(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.bgColor,
                      ),
                      strokeWidth: 2.5,
                    ),
                  )
                : KText(
                    text: btnTitle,
                    fontSize: fontSize,
                    color: btnTitleColor,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  ),
          ),
        ),
      ),
    );
  }
}
