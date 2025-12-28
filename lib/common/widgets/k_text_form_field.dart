import 'package:flutter/material.dart';
import 'package:meditation_app/common/widgets/k_text.dart';
import 'package:meditation_app/core/themes/app_colors.dart';

class KTextFormField extends StatelessWidget {
  final bool readOnly;
  final String? labelText;
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType keyboardType;
  final Iterable<String>? autofillHints;
  final int? maxLines;

  final int? maxLength; // 👈 NEW optional parameter

  final Widget? suffixIcon;
  final Function(String)? onChanged;

  const KTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.autofillHints,
    this.labelText,
    this.maxLines,
    this.readOnly = false,
    this.suffixIcon,
    this.onChanged,
    this.maxLength, // 👈 include in constructor
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null && labelText!.isNotEmpty) ...[
          KText(
            textAlign: TextAlign.start,
            text: labelText!,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.titleColor,
          ),
          const SizedBox(height: 10),
        ],

        TextFormField(
          readOnly: readOnly,
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          keyboardType: keyboardType,
          autofillHints: autofillHints,
          maxLines: maxLines ?? 1,
          maxLength: maxLength,
          // 👈 ADDED HERE
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: "GoogleSans",
          ),
          onChanged: onChanged,

          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: AppColors.textFieldBgColor,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.subTitleColor,
                width: 0.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.subTitleColor,
                width: 0.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.errorTextFormFieldErrorBorderColor,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
            ),
            hintText: hintText,
            errorStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: "GoogleSans",
            ),
            hintStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: "GoogleSans",
              color: AppColors.textFieldHintColor,
            ),
          ),
        ),
      ],
    );
  }
}
