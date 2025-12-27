import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/common/widgets/k_filled_btn.dart';
import 'package:meditation_app/common/widgets/k_text.dart';
import 'package:meditation_app/core/constants/app_assets_constants.dart';
import 'package:meditation_app/core/constants/app_router_constants.dart';
import 'package:meditation_app/core/themes/app_colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Bg Color
          SvgPicture.asset(
                AppAssetsConstants.welcome,
                width: double.maxFinite,
                height: double.maxFinite,
                fit: BoxFit.cover,
              )
              .animate()
              .fadeIn(duration: 800.ms, curve: Curves.easeInOut)
              .scale(
                begin: const Offset(1.1, 1.1),
                end: const Offset(1.0, 1.0),
                duration: 1200.ms,
                curve: Curves.easeOutCubic,
              ),

          Positioned(
            top: 60,
            right: 20,
            left: 20,
            child: Column(
              children: [
                // Hi Username, Welcome
                KText(
                      maxLines: 2,
                      softWrap: true,
                      text: "Hi Afsar, Welcome",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      fontSize: 34,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFFFFECCC),
                    )
                    .animate()
                    .fadeIn(delay: 40.ms, curve: Curves.easeIn)
                    .slideY(begin: -0.5, end: 0),

                // To Silent Moon
                KText(
                      maxLines: 2,
                      softWrap: true,
                      text: "to Silent Moon",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      fontSize: 34,
                      fontWeight: FontWeight.w200,
                      color: Color(0xFFFFECCC),
                    )
                    .animate()
                    .fadeIn(delay: 80.ms, curve: Curves.easeIn)
                    .slideY(begin: -0.5, end: 0),

                const SizedBox(height: 30),

                // Subtitle
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child:
                      KText(
                            maxLines: 3,
                            softWrap: true,
                            text:
                                "Explore the app, Find some peace of mind to prepare for meditation.",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.visible,
                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                            color: Color(0xFFFFECCC),
                          )
                          .animate()
                          .fadeIn(delay: 120.ms, curve: Curves.easeIn)
                          .slideY(begin: -0.5, end: 0),
                ),
              ],
            ),
          ),

          // Get Started
          Positioned(
                bottom: 60,
                right: 20,
                left: 20,
                child: KFilledBtn(
                  btnTitle: "Get Started",
                  btnBgColor: AppColors.bgColor,
                  btnTitleColor: AppColors.titleColor,
                  onTap: () {
                    // Recovery Screen
                    GoRouter.of(
                      context,
                    ).pushReplacementNamed(AppRouterConstants.recovery);
                  },
                  borderRadius: 30,
                  fontSize: 16,
                  btnHeight: 55,
                  btnWidth: double.maxFinite,
                ),
              )
              .animate()
              .fadeIn(delay: 120.ms, curve: Curves.easeIn)
              .slideX(begin: -0.5, end: 0),
        ],
      ),
    );
  }
}
