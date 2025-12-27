import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation_app/core/constants/app_assets_constants.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/features/bottom_nav/presentation/cubit/bottom_nav/bottom_nav_cubit.dart';
import 'package:meditation_app/features/home/presentation/screens/home_screen.dart';
import 'package:meditation_app/features/meditation/presentation/screens/meditation_screen.dart';
import 'package:meditation_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:meditation_app/features/yoga/presentation/screens/yoga_level_screen.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    // Screens
    final List<Widget> screens = [
      const HomeScreen(),
      const MeditationScreen(),
      const YogaLevelScreen(),
      const ProfileScreen(),
    ];

    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        final selectedIndex = (state is BottomNavSelected)
            ? state.selectedIndex
            : 0;

        return Scaffold(
          backgroundColor: AppColors.bgColor,

          body: IndexedStack(index: selectedIndex, children: screens),

          bottomNavigationBar: Directionality(
            textDirection: TextDirection.ltr,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: AppColors.subTitleColor.withOpacity(0.2),
                    // TOP BORDER
                    width: 1,
                  ),
                ),
              ),
              child: NavigationBarTheme(
                data: NavigationBarThemeData(
                  backgroundColor: AppColors.bgColor,
                  indicatorColor: AppColors.primaryColor.withOpacity(0.15),

                  labelTextStyle: MaterialStateProperty.resolveWith(
                    (states) => TextStyle(
                      fontFamily: "GoogleSans",
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: states.contains(MaterialState.selected)
                          ? AppColors.primaryColor
                          : AppColors.subTitleColor,
                    ),
                  ),
                ),
                child: NavigationBar(
                  height: 65,
                  elevation: 0,
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) {
                    context.read<BottomNavCubit>().selectBottomNav(index);
                  },
                  labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,

                  destinations: [
                    // Home
                    NavigationDestination(
                      icon: SvgPicture.asset(
                        AppAssetsConstants.home,
                        height: 24,
                        color: AppColors.subTitleColor,
                      ),
                      selectedIcon: SvgPicture.asset(
                        AppAssetsConstants.home,
                        height: 24,
                        color: AppColors.primaryColor,
                      ),
                      label: "Home",
                    ),

                    // Meditation
                    NavigationDestination(
                      icon: SvgPicture.asset(
                        AppAssetsConstants.meditation,
                        height: 24,
                        color: AppColors.subTitleColor,
                      ),
                      selectedIcon: SvgPicture.asset(
                        AppAssetsConstants.meditation,
                        height: 24,
                        color: AppColors.primaryColor,
                      ),
                      label: "Meditation",
                    ),

                    NavigationDestination(
                      icon: SvgPicture.asset(
                        AppAssetsConstants.yoga,
                        height: 24,
                        color: AppColors.subTitleColor,
                      ),
                      selectedIcon: SvgPicture.asset(
                        AppAssetsConstants.yoga,
                        height: 24,
                        color: AppColors.primaryColor,
                      ),
                      label: "Yoga",
                    ),

                    // Profile
                    NavigationDestination(
                      icon: SvgPicture.asset(
                        AppAssetsConstants.profile,
                        height: 24,
                        color: AppColors.subTitleColor,
                      ),
                      selectedIcon: SvgPicture.asset(
                        AppAssetsConstants.profile,
                        height: 24,
                        color: AppColors.primaryColor,
                      ),
                      label: "Profile",
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
