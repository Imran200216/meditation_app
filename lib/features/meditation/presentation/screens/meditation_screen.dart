import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/common/widgets/widgets.dart';
import 'package:meditation_app/core/constants/constants.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/features/meditation/meditation.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key});

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  // Options
  List<String> options = ["All", "Anxious", "Sleep", "Kids", "Nature", "Dark"];

  String selectedOption = "All";

  @override
  Widget build(BuildContext context) {
    // Responsive
    final size = MediaQuery.of(context).size;
    final itemWidth = (size.width - 20 * 2 - 16) / 2;
    final itemHeight = itemWidth / 0.76;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
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
                      text: "Meditate",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColors.titleColor,
                    )
                    .animate()
                    .fadeIn(delay: 40.ms, curve: Curves.easeIn)
                    .slideY(begin: -0.5, end: 0),

                const SizedBox(height: 12),

                // Sub Title
                KText(
                      maxLines: 2,
                      softWrap: true,
                      text:
                          "we can learn how to recognize when our minds are doing their normal everyday acrobatics.",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: AppColors.subTitleColor,
                    )
                    .animate()
                    .fadeIn(delay: 80.ms, curve: Curves.easeIn)
                    .slideY(begin: -0.5, end: 0),

                const SizedBox(height: 30),

                // Chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: options.map((option) {
                      final bool isSelected = selectedOption == option;

                      return Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
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
                                      color: AppColors.subTitleColor
                                          .withOpacity(0.3),
                                    ),
                                  ),
                                  onSelected: (_) {
                                    setState(() {
                                      selectedOption = option;
                                    });
                                  },
                                )
                                // 🔥 ANIMATION HERE
                                .animate(target: isSelected ? 1 : 0)
                                .scale(
                                  begin: const Offset(1, 1),
                                  end: const Offset(1.1, 1.1),
                                  duration: 200.ms,
                                  curve: Curves.easeOut,
                                ),
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 30),

                GridView.builder(
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

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
