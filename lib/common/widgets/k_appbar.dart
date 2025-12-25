import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/core/themes/app_colors.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final VoidCallback? onBack;

  const KAppBar({
    super.key,
    required this.title,
    this.centerTitle = false,
    this.onBack,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
      leading: IconButton(
        onPressed:
            onBack ??
            () {
              GoRouter.of(context).pop();
            },
        icon: Icon(
          Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
          color: AppColors.bgColor,
        ),
      ),
      centerTitle: centerTitle,
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.bgColor,
          fontFamily: "GoogleSans",
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
    );
  }
}
