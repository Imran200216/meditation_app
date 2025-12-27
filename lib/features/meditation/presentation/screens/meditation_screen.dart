import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:meditation_app/common/widgets/k_text.dart';
import 'package:meditation_app/core/constants/app_assets_constants.dart';
import 'package:meditation_app/core/constants/app_router_constants.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/features/meditation/presentation/widgets/meditate_audio_card.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key});

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  final List<String> options = [
    "All",
    "Anxious",
    "Sleep",
    "Kids",
    "Nature",
    "Dark",
  ];

  String selectedOption = "All";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final itemWidth = (size.width - 20 * 2 - 16) / 2;
    final itemHeight = itemWidth / 0.76;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: CustomScrollView(
        slivers: [
          /// 🌿 LOTTIE SLIVER APP BAR
          SliverAppBar(
            backgroundColor: AppColors.bgColor,
            expandedHeight: size.height * 0.32,
            pinned: false,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Transform.scale(
                scale: 1.3,
                alignment: Alignment.center,
                child: Lottie.asset(
                  AppAssetsConstants.meditateLottie,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          /// 📌 PINNED MEDITATE HEADER
          SliverPersistentHeader(
            pinned: true,
            delegate: MeditationHeaderDelegate(height: 150),
          ),

          /// 🎯 CHIPS
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: options.map((option) {
                    final isSelected = selectedOption == option;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child:
                          ChoiceChip(
                                showCheckmark: false,
                                label: Text(
                                  option,
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : AppColors.titleColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                selected: isSelected,
                                selectedColor: AppColors.primaryColor,
                                backgroundColor: AppColors.bgColor,
                                shape: StadiumBorder(
                                  side: BorderSide(
                                    color: AppColors.subTitleColor.withOpacity(
                                      0.3,
                                    ),
                                  ),
                                ),
                                onSelected: (_) {
                                  setState(() => selectedOption = option);
                                },
                              )
                              .animate(target: isSelected ? 1 : 0)
                              .scale(
                                begin: const Offset(1, 1),
                                end: const Offset(1.1, 1.1),
                                duration: 200.ms,
                              ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),

          /// 🎵 AUDIO GRID
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
                    .fadeIn(delay: (index * 80).ms)
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

class MeditationHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double height;

  MeditationHeaderDelegate({required this.height});

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
      color: AppColors.bgColor,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      margin: EdgeInsets.symmetric(vertical: 5),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          KText(
            text: "Meditate",
            textAlign: TextAlign.center,
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: AppColors.titleColor,
          ),
          const SizedBox(height: 8),
          KText(
            text:
                "we can learn how to recognize when our minds are\ndoing their normal everyday acrobatics.",
            textAlign: TextAlign.center,
            maxLines: 3,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: AppColors.subTitleColor,
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
