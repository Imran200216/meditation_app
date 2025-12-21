import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/commons/widgets/k_text.dart';
import 'package:meditation_app/core/constants/app_assets_constants.dart';
import 'package:meditation_app/core/themes/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Screen Size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Svg
            SizedBox(
              width: screenWidth,
              height: screenHeight * 0.3,
              child: SvgPicture.asset(
                AppAssetsConstants.night,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Title
                  KText(
                        maxLines: 2,
                        softWrap: true,
                        text: "Good Night, Imran B",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.visible,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: AppColors.titleColor,
                      )
                      .animate()
                      .fadeIn(delay: 40.ms, curve: Curves.easeIn)
                      .slideX(begin: -0.5, end: 0),

                  // Sub Title
                  KText(
                        maxLines: 2,
                        softWrap: true,
                        text: "We Wish you have a good day",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.visible,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: AppColors.subTitleColor,
                      )
                      .animate()
                      .fadeIn(delay: 80.ms, curve: Curves.easeIn)
                      .slideX(begin: -0.5, end: 0),

                  const SizedBox(height: 30),

                  Stack(
                    children: [
                      // Daily Meditate Svg
                      SizedBox(
                        height: 100,
                        child: SvgPicture.asset(
                          AppAssetsConstants.dailyMeditate,
                          width: double.maxFinite,
                        ),
                      ),

                      //
                      Positioned(
                        left: 20,
                        right: 20,
                        bottom: 20,
                        top: 20,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // Title
                                KText(
                                  maxLines: 2,
                                  softWrap: true,
                                  text: "Daily Meditation",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.visible,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.bgColor,
                                ),

                                // Sub Title
                                KText(
                                  maxLines: 2,
                                  softWrap: true,
                                  text: "Meditations 3-10 MINS",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.visible,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.bgColor,
                                ),
                              ],
                            ),

                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.play_circle_fill_outlined,
                                color: AppColors.bgColor,
                                size: 42,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
