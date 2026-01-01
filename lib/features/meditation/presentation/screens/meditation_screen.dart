import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:meditation_app/common/widgets/k_text.dart';
import 'package:meditation_app/core/constants/app_assets_constants.dart';
import 'package:meditation_app/core/constants/app_router_constants.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/core/utils/logger_utils.dart';
import 'package:meditation_app/features/intro/data/data_source/local/get_user_local_data_source.dart';
import 'package:meditation_app/features/meditation/presentation/bloc/meditation_audio_category/meditation_audio_category_bloc.dart';
import 'package:meditation_app/features/meditation/presentation/bloc/meditation_audio_list/meditation_audio_list_bloc.dart';
import 'package:meditation_app/features/meditation/presentation/widgets/choice_chip_skeleton.dart';
import 'package:meditation_app/features/meditation/presentation/widgets/meditate_audio_card.dart';
import 'package:meditation_app/features/meditation/presentation/widgets/meditation_audio_card_skeleton.dart';
import 'package:meditation_app/providers/app_bloc_provider_extension.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key});

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  // Select Option Flag
  String selectedOption = "Meditation";

  @override
  void initState() {
    _meditationApiCalls();
    super.initState();
  }

  Future<void> _meditationApiCalls() async {
    await Future.wait([
      // Meditation Audio Category
      _getMeditationAudioCategory(),

      // Meditation Audio List
      _getMeditationAudioList(categoryName: "Meditation"),
    ]);
  }

  // Get Mediation Audio Category
  Future<void> _getMeditationAudioCategory() async {
    try {
      final localDataSource = GetUserLocalDataSource();

      final user = await localDataSource.getUser();

      if (user == null) {
        LoggerUtils.logError("No user found in Hive");
        return;
      }

      final userId = user.id;

      // Get Meditation Audio Category Bloc
      context.readMeditationAudioCategoryBloc.add(
        GetMeditationAudioCategoryEvent(userId: userId),
      );
    } catch (e) {
      LoggerUtils.logError("Error reading user from Hive: $e");
    }
  }

  // Get Meditation Audio List
  Future<void> _getMeditationAudioList({required String categoryName}) async {
    try {
      final localDataSource = GetUserLocalDataSource();

      final user = await localDataSource.getUser();

      if (user == null) {
        LoggerUtils.logError("No user found in Hive");
        return;
      }

      final userId = user.id;

      // Get Meditation Audio Category Bloc
      context.readMeditationAudioListBloc.add(
        GetMeditationAudioList(userId: userId, categoryName: categoryName),
      );
    } catch (e) {
      LoggerUtils.logError("Error reading user from Hive: $e");
    }
  }

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
              child:
                  BlocBuilder<
                    MeditationAudioCategoryBloc,
                    MeditationAudioCategoryState
                  >(
                    builder: (context, state) {
                      if (state is MeditationAudioCategoryLoading) {
                        return Row(
                          children: List.generate(
                            4,
                            (index) => const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              child: ChoiceChipSkeleton(),
                            ),
                          ),
                        );
                      }

                      if (state is MeditationAudioCategorySuccess) {
                        final categories =
                            state.meditationAudioCategory.categories;

                        LoggerUtils.logInfo(
                          'Categories count: ${categories.length}',
                        );

                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: categories.map((category) {
                              final isSelected = selectedOption == category;

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                ),
                                child:
                                    ChoiceChip(
                                          showCheckmark: false,
                                          label: Text(
                                            category,
                                            style: TextStyle(
                                              fontFamily: "GoogleSans",
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
                                            setState(
                                              () => selectedOption = category,
                                            );
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
                        );
                      }

                      if (state is MeditationAudioCategoryFailure) {
                        LoggerUtils.logError(state.message);
                        return SizedBox.shrink();
                      }

                      return SizedBox.shrink();
                    },
                  ),
            ),
          ),

          /// 🎵 AUDIO GRID
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver:
                BlocBuilder<MeditationAudioListBloc, MeditationAudioListState>(
                  builder: (context, state) {
                    if (state is GetMeditationAudioListLoading) {
                      return SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => const MeditateAudioCardSkeleton(),
                          childCount: 6,
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: itemWidth / itemHeight,
                        ),
                      );
                    }

                    if (state is GetMeditationAudioListSuccess) {
                      final audios = state.audios;

                      if (audios.audios.isEmpty) {
                        return SliverToBoxAdapter(
                          child: Center(
                            child: Text(
                              "No audios found",
                              style: TextStyle(color: AppColors.subTitleColor),
                            ),
                          ),
                        );
                      }

                      return SliverGrid(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final audio = audios.audios[index];

                          return MeditateAudioCard(
                                audioTitle: audio.description,
                                onTap: () {
                                  GoRouter.of(context).pushNamed(
                                    AppRouterConstants.audio,
                                    extra: audio,
                                  );
                                },
                              )
                              .animate()
                              .fadeIn(delay: (index * 80).ms)
                              .slideY(begin: 0.3, end: 0);
                        }, childCount: audios.audios.length),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: itemWidth / itemHeight,
                        ),
                      );
                    }

                    if (state is GetMeditationAudioListFailure) {
                      return SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                            "Failed to load audios",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      );
                    }

                    return SliverToBoxAdapter(child: SizedBox.shrink());
                  },
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
