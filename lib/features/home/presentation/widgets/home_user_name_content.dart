import 'package:flutter/material.dart';
import 'package:meditation_app/common/widgets/k_text.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/core/utils/greeting_utils.dart';

class HomeUserNameContent extends StatelessWidget {
  final String userName;

  const HomeUserNameContent({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return KText(
      maxLines: 2,
      softWrap: true,
      text:
      "${GreetingUtils.getGreetingText()}, $userName",
      fontSize: 24,
      fontWeight: FontWeight.w800,
      color: AppColors.titleColor,
    );
  }
}
