import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/common/widgets/k_text.dart';
import 'package:meditation_app/core/constants/app_router_constants.dart';
import 'package:meditation_app/core/themes/app_colors.dart';
import 'package:meditation_app/features/splash/presentation/widgets/splash_logo_quote_text.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Version, Build Number
  String _version = '';
  String _buildNumber = '';

  // Load App Info
  Future<void> _loadAppInfo() async {
    final info = await PackageInfo.fromPlatform();

    setState(() {
      _version = info.version;
      _buildNumber = info.buildNumber;
    });
  }

  @override
  void initState() {
    super.initState();

    // Load App Info
    _loadAppInfo();

    // Intro Screen
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).pushReplacementNamed(AppRouterConstants.intro);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Logo & Description
            Align(
              alignment: Alignment.center,
              child: Column(
                spacing: 12,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App Name
                  KText(
                        text: 'YogAura',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        color: AppColors.primaryColor,
                      )
                      .animate()
                      .fadeIn(duration: 400.ms)
                      .then(curve: Curves.easeInOutCubic)
                      .scale(
                        begin: const Offset(0.9, 0.9),
                        end: const Offset(1.4, 1.4),
                        duration: 300.ms,
                      ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SplashLogoQuoteText(text: "Breathe")
                          .animate()
                          .fadeIn(duration: 400.ms, delay: 300.ms)
                          .slideY(begin: 0.4, end: 0, curve: Curves.easeOut)
                          .scale(
                            begin: const Offset(0.9, 0.9),
                            end: const Offset(1, 1),
                          ),

                      const SizedBox(width: 8),

                      SplashLogoQuoteText(text: "Move")
                          .animate()
                          .fadeIn(duration: 400.ms, delay: 600.ms)
                          .slideY(begin: 0.4, end: 0, curve: Curves.easeOut)
                          .scale(
                            begin: const Offset(0.9, 0.9),
                            end: const Offset(1, 1),
                          ),

                      const SizedBox(width: 8),

                      SplashLogoQuoteText(text: "Heal")
                          .animate()
                          .fadeIn(duration: 400.ms, delay: 900.ms)
                          .slideY(begin: 0.4, end: 0, curve: Curves.easeOut)
                          .scale(
                            begin: const Offset(0.9, 0.9),
                            end: const Offset(1, 1),
                          ),
                    ],
                  ),
                ],
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: KText(
                text: _version.isEmpty
                    ? ''
                    : 'Version $_version ($_buildNumber)',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                maxLines: 1,
                textAlign: TextAlign.center,
                color: AppColors.primaryColor,
              ).animate().fadeIn(delay: 1200.ms, duration: 400.ms),
            ),
          ],
        ),
      ),
    );
  }
}
