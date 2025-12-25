import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:meditation_app/common/widgets/widgets.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/features/yoga/yoga.dart';

class YogaScreen extends StatefulWidget {
  const YogaScreen({super.key});

  @override
  State<YogaScreen> createState() => _YogaScreenState();
}

class _YogaScreenState extends State<YogaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Title
                KText(
                      maxLines: 2,
                      softWrap: true,
                      text: "Modern Wellness",
                      textAlign: TextAlign.center,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColors.titleColor,
                    )
                    .animate()
                    .fadeIn(
                      duration: 700.ms,
                      delay: 100.ms,
                      curve: Curves.easeOutCubic,
                    )
                    .slideY(
                      begin: -0.25,
                      end: 0,
                      duration: 700.ms,
                      curve: Curves.easeOutCubic,
                    ),

                const SizedBox(height: 12),

                // Sub Title
                KText(
                      maxLines: 2,
                      softWrap: true,
                      text:
                          "Find stillness in motion and harmony in every breath",
                      textAlign: TextAlign.center,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: AppColors.subTitleColor,
                    )
                    .animate()
                    .fadeIn(duration: 700.ms, delay: 250.ms)
                    .slideY(begin: -0.25, end: 0, duration: 700.ms),

                const SizedBox(height: 30),

                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 30,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 12);
                  },
                  itemBuilder: (context, index) {
                    return YogaCard(onTap: () {})
                        .animate()
                        .fadeIn(duration: 500.ms, delay: (350 + index * 60).ms)
                        .slideY(
                          begin: 0.25,
                          end: 0,
                          duration: 500.ms,
                          curve: Curves.easeOutCubic,
                        );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
