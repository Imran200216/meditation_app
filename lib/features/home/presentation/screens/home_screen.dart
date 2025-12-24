import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/commons/widgets/k_text.dart';
import 'package:meditation_app/core/constants/app_assets_constants.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/features/meditation/presentation/widgets/meditate_audio_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Screen Size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
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
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: AppColors.titleColor,
                      )
                      .animate()
                      .fadeIn(
                        duration: 600.ms,
                        delay: 100.ms,
                        curve: Curves.easeOut,
                      )
                      .slideY(
                        begin: -0.3,
                        end: 0,
                        duration: 600.ms,
                        curve: Curves.easeOut,
                      ),

                  // Sub Title
                  KText(
                        text: "We Wish you have a good day",
                        fontSize: 17,
                        color: AppColors.subTitleColor,
                      )
                      .animate()
                      .fadeIn(duration: 600.ms, delay: 250.ms)
                      .slideY(begin: -0.3, end: 0, duration: 600.ms),

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
                      )
                      .animate()
                      .fadeIn(duration: 700.ms, delay: 400.ms)
                      .slideY(begin: 0.3, end: 0, duration: 700.ms),
                ],
              ),
            ),

            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.76,
              ),
              itemCount: 20,
              // number of items
              itemBuilder: (context, index) {
                return MeditateAudioCard(
                      audioTitle: "Relaxation Music with Candle Love Move",
                      onTap: () {},
                    )
                    .animate()
                    .fadeIn(duration: 500.ms, delay: (index * 80).ms)
                    .slideY(begin: 0.3, end: 0, duration: 500.ms);
              },
            ),
          ],
        ),
      ),
    );
  }
}
