import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/common/widgets/k_filled_btn.dart';
import 'package:meditation_app/common/widgets/k_text.dart';
import 'package:meditation_app/core/constants/app_assets_constants.dart';
import 'package:meditation_app/core/constants/app_router_constants.dart';
import 'package:meditation_app/core/themes/app_colors.dart';

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

                  // Sign Up Btn
                  KFilledBtn(
                        btnTitle: "Sign Up",
                        btnBgColor: AppColors.primaryColor,
                        btnTitleColor: AppColors.bgColor,
                        onTap: () {
                          // Auth Sign Up Screen
                          GoRouter.of(
                            context,
                          ).pushReplacementNamed(AppRouterConstants.authSignUp);
                        },
                        borderRadius: 30,
                        fontSize: 16,
                        btnHeight: 55,
                        btnWidth: double.maxFinite,
                      )
                      .animate()
                      .fadeIn(delay: 120.ms)
                      .slideX(begin: -0.5, end: 0, curve: Curves.easeIn),

                  const SizedBox(height: 30),

                  Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Already have an account text
                          KText(
                            maxLines: 1,
                            softWrap: true,
                            text: "Already have an account?",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.visible,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: AppColors.authFooterContent,
                          ),

                          // Log In Text Btn
                          TextButton(
                            onPressed: () {
                              // Auth Sign In Screen
                              GoRouter.of(context).pushReplacementNamed(
                                AppRouterConstants.authSignIn,
                              );
                            },
                            child: KText(
                              maxLines: 1,
                              softWrap: true,
                              text: "Log In",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.visible,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      )
                      .animate()
                      .fadeIn(delay: 160.ms)
                      .slideX(begin: -0.5, end: 0, curve: Curves.easeIn),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
