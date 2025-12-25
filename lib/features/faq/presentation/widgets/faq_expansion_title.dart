import 'package:flutter/material.dart';
import 'package:meditation_app/common/widgets/k_text.dart';
import 'package:meditation_app/core/themes/app_colors.dart';

class FaqExpansionTile extends StatelessWidget {
  final String faqTitle;
  final String faqDescription;

  const FaqExpansionTile({
    super.key,
    required this.faqTitle,
    required this.faqDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.bgColor,
      child: ExpansionTile(
        dense: false,
        title: KText(
          text: faqTitle,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.titleColor,
          textAlign: TextAlign.start,
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.subTitleColor, width: 0.4),
          borderRadius: BorderRadius.circular(12),
        ),
        collapsedShape:  RoundedRectangleBorder(
          side: BorderSide(color: AppColors.subTitleColor, width: 0.4),
          borderRadius: BorderRadius.circular(12),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, bottom: 16),
            child: KText(
              text: faqDescription,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.subTitleColor,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
