import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:meditation_app/common/widgets/widgets.dart';
import 'package:meditation_app/core/constants/constants.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/core/utils/utils.dart';
import 'package:meditation_app/features/meditation/meditation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Screen Size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;
    final itemWidth = (size.width - 20 * 2 - 16) / 2;
    final itemHeight = itemWidth / 0.76;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Svg
              Container(
                width: screenWidth,
                height: screenHeight * 0.3,
                color: GreetingUtils.getBackgroundColor(
                  morningColor: Colors.orange.shade100,
                  nightColor: Colors.black,
                ),
                child: Lottie.asset(
                  GreetingUtils.getLottieAsset(
                    morningLottie: AppAssetsConstants.morningLottie,
                    nightLottie: AppAssetsConstants.nightLottie,
                  ),
                  animate: true,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Title
                    KText(
                          maxLines: 2,
                          softWrap: true,
                          text: "${GreetingUtils.getGreetingText()}, Imran B",
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

                            // Daily Meditation
                            Positioned(
                              left: 20,
                              right: 20,
                              bottom: 20,
                              top: 20,
                              child: GestureDetector(
                                onTap: () {
                                  HapticFeedback.heavyImpact();

                                  // Audio Screen
                                  GoRouter.of(
                                    context,
                                  ).pushNamed(AppRouterConstants.audio);
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                      onPressed: () {
                                        // Audio Screen
                                        GoRouter.of(
                                          context,
                                        ).pushNamed(AppRouterConstants.audio);
                                      },
                                      icon: Icon(
                                        Icons.play_circle_fill_outlined,
                                        color: AppColors.bgColor,
                                        size: 42,
                                      ),
                                    ),
                                  ],
                                ),
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: itemWidth / itemHeight,
                ),
                itemCount: 20,
                // number of items
                itemBuilder: (context, index) {
                  return MeditateAudioCard(
                        audioTitle: "Relaxation Music with Candle Love Move",
                        onTap: () {
                          // Audio Screen
                          GoRouter.of(
                            context,
                          ).pushNamed(AppRouterConstants.audio);
                        },
                      )
                      .animate()
                      .fadeIn(duration: 500.ms, delay: (index * 80).ms)
                      .slideY(begin: 0.3, end: 0, duration: 500.ms);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
