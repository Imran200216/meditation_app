import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/common/widgets/k_text.dart';
import 'package:meditation_app/core/constants/app_assets_constants.dart';
import 'package:meditation_app/core/constants/app_router_constants.dart';
import 'package:meditation_app/core/service/apple_auth_service.dart';
import 'package:meditation_app/core/service/google_auth_service.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/core/utils/logger_utils.dart';
import 'package:meditation_app/features/auth/presentation/widgets/social_btn.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                  flex: 10,
                  child: SvgPicture.asset(
                    AppAssetsConstants.intro,
                    width: double.maxFinite,
                    fit: BoxFit.fitWidth,
                  ),
                )
                .animate()
                .slideY(
                  begin: -0.5,
                  end: 0,
                  duration: 700.ms,
                  curve: Curves.easeIn,
                )
                .fadeIn(),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Title
                  KText(
                        maxLines: 2,
                        softWrap: true,
                        text: "We are What we do",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: AppColors.titleColor,
                      )
                      .animate()
                      .fadeIn(delay: 40.ms, curve: Curves.easeIn)
                      .slideX(begin: -0.5, end: 0),

                  const SizedBox(height: 14),

                  // Sub Title
                  KText(
                        maxLines: 2,
                        softWrap: true,
                        text:
                            "Thousands of people are using silent moon fo smalls meditation",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: AppColors.subTitleColor,
                      )
                      .animate()
                      .fadeIn(delay: 80.ms, curve: Curves.easeIn)
                      .slideX(begin: -0.5, end: 0),

                  const SizedBox(height: 30),

                  // Continue with Google Btn
                  SocialBtn(
                    btnHeight: 55,
                    btnTitle: "Continue into Google",
                    borderRadius: 30,
                    borderColor: AppColors.socialBtnBorderColor,
                    bgColor: AppColors.bgColor,
                    textColor: AppColors.titleColor,
                    svgIcon: AppAssetsConstants.google,
                    onTap: () async {
                      final googleAuthService = GoogleAuthService();

                      final user = await googleAuthService.signIn();

                      if (user != null) {
                        LoggerUtils.logInfo("ID: ${user.id}");
                        LoggerUtils.logInfo("Name: ${user.name}");
                        LoggerUtils.logInfo("Email: ${user.email}");
                        LoggerUtils.logInfo(
                          "Profile Image: ${user.profileImage}",
                        );

                        // Recovery Screen
                        GoRouter.of(
                          context,
                        ).pushReplacementNamed(AppRouterConstants.recovery);
                      }
                    },
                    btnWidth: double.maxFinite,
                  ),

                  Platform.isIOS
                      ? const SizedBox(height: 20)
                      : SizedBox.shrink(),

                  // Continue with Apple Btn
                  Platform.isIOS
                      ? SocialBtn(
                          btnHeight: 55,
                          btnTitle: "Continue into Apple",
                          borderRadius: 30,
                          borderColor: AppColors.socialBtnBorderColor,
                          bgColor: AppColors.bgColor,
                          textColor: AppColors.titleColor,
                          svgIcon: AppAssetsConstants.apple,
                          onTap: () async {
                            final appleAuthService = AppleAuthService();

                            final appleAuthId = await appleAuthService
                                .getAppleAuthId();

                            LoggerUtils.logInfo('Apple Auth ID: $appleAuthId');
                          },
                          btnWidth: double.maxFinite,
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
