import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/commons/widgets/k_text.dart';
import 'package:meditation_app/core/constants/app_assets_constants.dart';
import 'package:meditation_app/core/constants/app_router_constants.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:meditation_app/features/profile/presentation/widgets/profile_list_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      "https://plus.unsplash.com/premium_photo-1681493353999-a3eea8b95e1d?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  height: 100,
                  width: 100,
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
                ),

                const SizedBox(height: 3),

                // Sub Title
                KText(
                  text: "kennyJackson162002@gmail.com",
                  textAlign: TextAlign.center,
                  softWrap: true,
                  maxLines: 3,
                  color: AppColors.subTitleColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),

                const SizedBox(height: 40),

                Column(
                  spacing: 14,
                  children: [
                    // Personal Info
                    ProfileListTile(
                      leadingSvgPath: AppAssetsConstants.profile,
                      title: "Personal Info",
                      subtitle: "Update your profile and personal preferences",
                      onTap: () {
                        // Personal Info Screen
                        GoRouter.of(
                          context,
                        ).pushNamed(AppRouterConstants.personalInfo);
                      },
                    ),

                    // About
                    ProfileListTile(
                      leadingSvgPath: AppAssetsConstants.about,
                      title: "About Us",
                      subtitle:
                          "Explore our purpose, values, and the vision behind the app",
                      onTap: () {
                        // About Us Screen
                        GoRouter.of(
                          context,
                        ).pushNamed(AppRouterConstants.aboutUs);
                      },
                    ),

                    // Share App
                    ProfileListTile(
                      leadingSvgPath: AppAssetsConstants.share,
                      title: "Share App",
                      subtitle: "Share calm moments with your friends",
                      onTap: () {},
                    ),

                    // FAQ's
                    ProfileListTile(
                      leadingSvgPath: AppAssetsConstants.faq,
                      title: "FAQ's",
                      subtitle: "Learn more about the app",
                      onTap: () {
                        // FAQ's Screen
                        GoRouter.of(context).pushNamed(AppRouterConstants.faq);
                      },
                    ),

                    // Privacy Policy
                    ProfileListTile(
                      leadingSvgPath: AppAssetsConstants.privacyPolicy,
                      title: "Privacy Policy",
                      subtitle: "Know how we use and secure your data",
                      onTap: () {},
                    ),

                    // Contact Support
                    ProfileListTile(
                      leadingSvgPath: AppAssetsConstants.support,
                      title: "Contact Support",
                      subtitle: "Reach out for any support",
                      onTap: () {},
                    ),

                    // Logout
                    ProfileListTile(
                      leadingSvgPath: AppAssetsConstants.logout,
                      title: "Logout",
                      subtitle: "See you again",
                      onTap: () {
                        // Intro Screen
                        GoRouter.of(context).goNamed(AppRouterConstants.intro);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
