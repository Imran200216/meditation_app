import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/core/constants/app_assets_constants.dart';
import 'package:meditation_app/core/constants/app_content_constants.dart';
import 'package:meditation_app/core/constants/app_router_constants.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/core/utils/logger_utils.dart';
import 'package:meditation_app/core/utils/url_launcher_utils.dart';
import 'package:meditation_app/features/auth/data/datasource/get_user_local_data_source.dart';
import 'package:meditation_app/features/auth/presentation/bloc/get_user_auth_details/get_user_auth_details_bloc.dart';
import 'package:meditation_app/features/profile/presentation/widgets/profile_list_tile.dart';
import 'package:meditation_app/features/profile/presentation/widgets/profile_username_email_avatar_content.dart';
import 'package:meditation_app/features/profile/presentation/widgets/profile_username_email_avatar_content_skeleton.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    // Get User Profile
    _getUserProfile();
  }

  // Get User Profile Function
  Future<void> _getUserProfile() async {
    try {
      final localDataSource = GetUserLocalDataSource();

      final user = await localDataSource.getUser();

      if (user == null) {
        LoggerUtils.logError("No user found in Hive");
        return;
      }

      final userId = user.id;

      // Get User Auth Details
      context.read<GetUserAuthDetailsBloc>().add(
        GetUserByIdAuthEvent(userId: userId),
      );
    } catch (e) {
      LoggerUtils.logError("Error reading user from Hive: $e");
    }
  }

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
      body: RefreshIndicator.adaptive(
        backgroundColor: AppColors.primaryColor,
        color: AppColors.bgColor,
        onRefresh: () async {
          await _getUserProfile();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BlocBuilder<GetUserAuthDetailsBloc, GetUserAuthDetailsState>(
                    builder: (context, state) {
                      if (state is GetUserAuthDetailsLoading) {
                        return ProfileUsernameEmailAvatarContentSkeleton();
                      } else if (state is GetUserAuthDetailsSuccess) {
                        return ProfileUsernameEmailAvatarContent(
                          profileAvatarImageUrl: state.userEntity.profileImage,
                          userName: state.userEntity.firstName,
                          userEmailAddress: state.userEntity.email,
                        );
                      } else if (state is GetUserAuthDetailsFailure) {
                        return ProfileUsernameEmailAvatarContent(
                          profileAvatarImageUrl: "",
                          userName: "NO UserName",
                          userEmailAddress: "No Email Address",
                        );
                      }

                      return SizedBox.shrink();
                    },
                  ),

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
      ),
    );
  }
}
