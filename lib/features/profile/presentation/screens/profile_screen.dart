import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/common/widgets/widgets.dart';
import 'package:meditation_app/core/constants/constants.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/core/utils/utils.dart';
import 'package:meditation_app/features/profile/profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Profile Tiles
    final List<Widget> profileTiles = [
      ProfileListTile(
        leadingSvgPath: AppAssetsConstants.profile,
        title: "Personal Info",
        subtitle: "Update your profile and personal preferences",
        onTap: () {
          // Personal Info Screen
          GoRouter.of(context).pushNamed(AppRouterConstants.personalInfo);
        },
      ),
      ProfileListTile(
        leadingSvgPath: AppAssetsConstants.about,
        title: "About Us",
        subtitle: "Explore our purpose, values, and the vision behind the app",
        onTap: () {
          // About Us Screen
          GoRouter.of(context).pushNamed(AppRouterConstants.aboutUs);
        },
      ),
      ProfileListTile(
        leadingSvgPath: AppAssetsConstants.share,
        title: "Share App",
        subtitle: "Share calm moments with your friends",
        onTap: () {},
      ),
      ProfileListTile(
        leadingSvgPath: AppAssetsConstants.faq,
        title: "FAQ's",
        subtitle: "Learn more about the app",
        onTap: () {
          // FAQ Screen
          GoRouter.of(context).pushNamed(AppRouterConstants.faq);
        },
      ),
      ProfileListTile(
        leadingSvgPath: AppAssetsConstants.privacyPolicy,
        title: "Privacy Policy",
        subtitle: "Know how we use and secure your data",
        onTap: () {
          // Privacy Policy
          UrlLauncherUtils.launchUrlLink(AppContentConstants.privacyPolicy);
        },
      ),
      ProfileListTile(
        leadingSvgPath: AppAssetsConstants.support,
        title: "Contact Support",
        subtitle: "Reach out for any support",
        onTap: () {
          // Privacy Policy
          UrlLauncherUtils.launchUrlLink(AppContentConstants.contactSupport);
        },
      ),
      ProfileListTile(
        leadingSvgPath: AppAssetsConstants.logout,
        title: "Logout",
        subtitle: "See you again",
        onTap: () {
          // Into Screen
          GoRouter.of(context).goNamed(AppRouterConstants.intro);
        },
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Avatar
                ProfileAvatar(
                      personImageUrl:
                          "https://plus.unsplash.com/premium_photo-1681493353999-a3eea8b95e1d",
                      height: 100,
                      width: 100,
                    )
                    .animate()
                    .fadeIn(duration: 700.ms)
                    .scale(
                      begin: const Offset(0.85, 0.85),
                      end: const Offset(1, 1),
                      duration: 700.ms,
                      curve: Curves.easeOutCubic,
                    ),

                const SizedBox(height: 8),

                // Title
                KText(
                      text: "Kenny Jackson",
                      softWrap: true,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      color: AppColors.titleColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 200.ms)
                    .slideY(
                      begin: -0.25,
                      end: 0,
                      duration: 600.ms,
                      curve: Curves.easeOut,
                    ),

                const SizedBox(height: 3),

                // Sub Title
                KText(
                      text: "kennyJackson162002@gmail.com",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.subTitleColor,
                    )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 300.ms)
                    .slideY(begin: -0.2, end: 0, duration: 600.ms),

                const SizedBox(height: 40),

                Column(
                  children: List.generate(profileTiles.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: profileTiles[index]
                          .animate()
                          .fadeIn(
                            duration: 500.ms,
                            delay: (400 + index * 80).ms,
                          )
                          .slideY(
                            begin: 0.25,
                            end: 0,
                            duration: 500.ms,
                            curve: Curves.easeOutCubic,
                          ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
