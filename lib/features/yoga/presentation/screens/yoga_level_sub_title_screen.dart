import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/common/widgets/k_appbar.dart';
import 'package:meditation_app/core/constants/app_router_constants.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/features/yoga/presentation/yoga_presentation.dart';

class YogaLevelSubTitleScreen extends StatelessWidget {
  const YogaLevelSubTitleScreen({super.key});

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
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        separatorBuilder: (context, index) {
          return SizedBox(height: 12);
        },
        itemBuilder: (context, index) {
          return YogaLevelSubTitleCard(
                title: "Easy Pose",
                benefits: "It improves focus and concentration",
                onTap: () {
                  GoRouter.of(
                    context,
                  ).pushNamed(AppRouterConstants.yogaDescription);
                },
                duration: "2 min",
                imageUrl:
                    "https://freedomgenesis.com/wp-content/uploads/2019/11/young-woman-in-white-pants-doing-tree-pose.jpg?x59136",
              )
              .animate()
              .fadeIn(delay: (index * 40).ms, duration: 200.ms)
              .slideY(begin: 0.3, end: 0, curve: Curves.easeOut);
        },

        itemCount: 30,
      ),
    );
  }
}
