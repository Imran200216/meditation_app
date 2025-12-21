import 'package:flutter/material.dart';
import 'package:meditation_app/commons/widgets/k_text.dart';
import 'package:meditation_app/core/themes/app_colors.dart';

class KPasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final bool readOnly;

  const KPasswordTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.validator,
    this.onChanged,
    this.readOnly = false,
  });

  @override
  State<KPasswordTextFormField> createState() => _KPasswordTextFormFieldState();
}

class _KPasswordTextFormFieldState extends State<KPasswordTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null && widget.labelText!.isNotEmpty) ...[
          KText(
            textAlign: TextAlign.start,
            text: widget.labelText!,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.titleColor,
          ),
          const SizedBox(height: 10),
        ],

        TextFormField(
          readOnly: widget.readOnly,
          controller: widget.controller,
          validator: widget.validator,
          obscureText: _obscureText,
          keyboardType: TextInputType.visiblePassword,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: "GoogleSans",
          ),
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: AppColors.subTitleColor,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
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
            hintText: widget.hintText,
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
