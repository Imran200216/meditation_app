import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meditation_app/core/themes/app_colors.dart';

class RecoveryTile extends StatelessWidget {
  final String title;

  final bool value;
  final ValueChanged<bool?> onChanged;

  final Color bgColor;
  final Color borderColor;
  final Color textColor;
  final Color checkColor;
  final Color checkBoxBorderColor;

  const RecoveryTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    required this.bgColor,
    required this.borderColor,
    required this.textColor,
    required this.checkColor,
    required this.checkBoxBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 0.4),
      ),
      child: CheckboxListTile(
        value: value,
        onChanged: (bool? newValue) {
          // Add haptic feedback
          HapticFeedback.selectionClick();
          // Call the original callback
          onChanged(newValue);
        },
        title: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: "GoogleSans",
          ),
        ),
        activeColor: AppColors.bgColor,
        // you can also make this configurable
        checkboxShape: CircleBorder(
          side: BorderSide(color: checkBoxBorderColor),
        ),
        checkColor: checkColor,

        controlAffinity: ListTileControlAffinity.trailing,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
