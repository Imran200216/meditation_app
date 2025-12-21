import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/commons/widgets/k_filled_btn.dart';
import 'package:meditation_app/commons/widgets/k_text.dart';
import 'package:meditation_app/core/constants/app_assets_constants.dart';
import 'package:meditation_app/core/constants/app_router_constants.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/core/utils/logger_utils.dart';
import 'package:meditation_app/features/recovery/presentation/cubit/recovery_select/recovery_select_cubit.dart';
import 'package:meditation_app/features/recovery/presentation/widgets/recovery_list_tile.dart';

class RecoveryScreen extends StatelessWidget {
  const RecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Options
    final List<String> options = [
      "Reduce stress",
      "Improve Performance",
      "Reduce anxiety",
      "Reduce depression",
      "Increase Happiness",
      "Personal Growth",
      "Better Sleep",
    ];

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      bottomNavigationBar:
          BlocBuilder<RecoverySelectCubit, RecoverySelectState>(
            builder: (context, state) {
              if (state is RecoverySelectLoaded &&
                  state.selectedOptions.isNotEmpty) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 120,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.subTitleColor,
                      width: 0.3,
                    ),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: AppColors.bgColor,
                  ),
                  child: Center(
                    child: KFilledBtn(
                      btnTitle: "Sign Up",
                      btnBgColor: AppColors.primaryColor,
                      btnTitleColor: AppColors.bgColor,
                      onTap: () {
                        // use selected options
                        final selected = (state).selectedOptions;
                        LoggerUtils.logInfo(selected.toString());

                        // Reminders Screen
                        GoRouter.of(
                          context,
                        ).pushReplacementNamed(AppRouterConstants.reminders);
                      },
                      borderRadius: 30,
                      fontSize: 16,
                      btnHeight: 55,
                      btnWidth: double.maxFinite,
                    ),
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),

      body: SafeArea(
        top: true,
        bottom: true,
        child: Stack(
          children: [
            // Bg
            Positioned(
              top: 60,
              right: 0,
              left: 0,
              bottom: 0,
              child: SvgPicture.asset(
                AppAssetsConstants.recoveryBg,
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Title
                    KText(
                      maxLines: 1,
                      softWrap: true,
                      text: "What Brings you",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColors.titleColor,
                    ),

                    // Subtitle
                    KText(
                      maxLines: 1,
                      softWrap: true,
                      text: "to Silent Moon?",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      fontSize: 26,
                      fontWeight: FontWeight.w300,
                      color: AppColors.subTitleColor,
                    ),

                    const SizedBox(height: 30),

                    // Options
                    BlocBuilder<RecoverySelectCubit, RecoverySelectState>(
                      builder: (context, state) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: options.length,
                          itemBuilder: (context, index) {
                            final option = options[index];
                            final isSelected = context
                                .read<RecoverySelectCubit>()
                                .isSelected(option);

                            return RecoveryTile(
                              title: option,
                              value: isSelected,
                              onChanged: (_) {
                                context
                                    .read<RecoverySelectCubit>()
                                    .toggleOption(option);
                              },
                              bgColor: isSelected
                                  ? AppColors.primaryColor
                                  : AppColors.bgColor,

                              borderColor: AppColors.subTitleColor,
                              textColor: isSelected
                                  ? AppColors.bgColor
                                  : AppColors.titleColor,
                              checkColor: AppColors.primaryColor,
                              checkBoxBorderColor: AppColors.subTitleColor,
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
