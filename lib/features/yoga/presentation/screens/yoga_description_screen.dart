import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/common/widgets/widgets.dart';
import 'package:meditation_app/core/themes/app_colors.dart';

class YogaDescriptionScreen extends StatelessWidget {
  const YogaDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: KAppBar(
        title: "Level 1",
        centerTitle: true,
        onBack: () {
          GoRouter.of(context).pop();
        },
      ),
      body: SafeArea(child: Column(children: [])),
    );
  }
}
