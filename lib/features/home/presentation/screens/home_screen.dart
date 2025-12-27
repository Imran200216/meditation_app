import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:meditation_app/common/widgets/k_text.dart';
import 'package:meditation_app/core/constants/app_assets_constants.dart';
import 'package:meditation_app/core/constants/app_router_constants.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/core/utils/greeting_utils.dart';
import 'package:meditation_app/features/meditation/presentation/widgets/meditate_audio_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final itemWidth = (size.width - 20 * 2 - 16) / 2;
    final itemHeight = itemWidth / 0.76;

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // ================= SLIVER APP BAR =================
          SliverAppBar(
            expandedHeight: size.height * 0.3,
            pinned: false,
            floating: false,
            automaticallyImplyLeading: false,
            backgroundColor: GreetingUtils.getBackgroundColor(
              morningColor: Colors.orange.shade100,
              nightColor: Colors.black,
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Lottie.asset(
                GreetingUtils.getLottieAsset(
                  morningLottie: AppAssetsConstants.morningLottie,
                  nightLottie: AppAssetsConstants.nightLottie,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // ================= PINNED GREETING HEADER =================
          SliverPersistentHeader(
            pinned: true,

            delegate: GreetingHeaderDelegate(
              height: 110,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:
                    Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            KText(
                              maxLines: 2,
                              softWrap: true,
                              text:
                                  "${GreetingUtils.getGreetingText()}, Imran B",
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: AppColors.titleColor,
                            ),
                            const SizedBox(height: 6),
                            KText(
                              text: "We Wish you have a good day",
                              fontSize: 17,
                              color: AppColors.subTitleColor,
                            ),
                          ],
                        )
                        .animate()
                        .fadeIn(duration: 500.ms)
                        .slideY(begin: -0.2, end: 0),
              ),
            ),
          ),

          // ================= DAILY MEDITATION CARD =================
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Stack(
                children: [
                  SizedBox(
                    height: 100,
                    child: SvgPicture.asset(
                      AppAssetsConstants.dailyMeditate,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () {
                        HapticFeedback.heavyImpact();
                        GoRouter.of(
                          context,
                        ).pushNamed(AppRouterConstants.audio);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                KText(
                                  text: "Daily Meditation",
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.bgColor,
                                ),
                                KText(
                                  text: "Meditations 3-10 MINS",
                                  fontSize: 14,
                                  color: AppColors.bgColor,
                                ),
                              ],
                            ),
                            Icon(
                              Icons.play_circle_fill_outlined,
                              size: 42,
                              color: AppColors.bgColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ).animate().fadeIn(duration: 700.ms).slideY(begin: 0.3, end: 0),
            ),
          ),

          // ================= SLIVER GRID =================
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return MeditateAudioCard(
                      audioTitle: "Relaxation Music with Candle Love Move",
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).pushNamed(AppRouterConstants.audio);
                      },
                    )
                    .animate()
                    .fadeIn(duration: 200.ms, delay: (index * 80).ms)
                    .slideY(begin: 0.3, end: 0);
              }, childCount: 20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: itemWidth / itemHeight,
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 30)),
        ],
      ),
    );
  }
}

class GreetingHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  GreetingHeaderDelegate({required this.child, required this.height});

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      alignment: Alignment.centerLeft,
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
