import 'package:go_router/go_router.dart';
import 'package:meditation_app/core/constants/app_router_constants.dart';
import 'package:meditation_app/features/splash/splash.dart';
import 'package:meditation_app/features/intro/intro.dart';
import 'package:meditation_app/features/auth/auth.dart';
import 'package:meditation_app/features/welcome/welcome.dart';
import 'package:meditation_app/features/recovery/recovery.dart';
import 'package:meditation_app/features/reminders/reminders.dart';
import 'package:meditation_app/features/language/language.dart';
import 'package:meditation_app/features/bottom_nav/bottom_nav.dart';
import 'package:meditation_app/features/personal_info/personal_info.dart';
import 'package:meditation_app/features/faq/faq.dart';
import 'package:meditation_app/features/about_us/about_us.dart';
import 'package:meditation_app/features/audio/audio.dart';
import 'package:meditation_app/features/yoga/presentation/yoga_presentation.dart';

GoRouter appRouter = GoRouter(
  initialLocation: "/splash",

  routes: [
    // Splash Screen
    GoRoute(
      path: '/splash',
      name: AppRouterConstants.splash,
      builder: (context, state) {
        return SplashScreen();
      },
    ),

    // Intro Screen
    GoRoute(
      path: '/intro',
      name: AppRouterConstants.intro,
      builder: (context, state) {
        return IntroScreen();
      },
    ),

    // Auth SignUp Screen
    GoRoute(
      path: '/authSignUp',
      name: AppRouterConstants.authSignUp,
      builder: (context, state) {
        return AuthSignUpScreen();
      },
    ),

    // Auth Sign In Screen
    GoRoute(
      path: '/authSignIn',
      name: AppRouterConstants.authSignIn,
      builder: (context, state) {
        return AuthSignInScreen();
      },
    ),

    // Welcome screen
    GoRoute(
      path: '/welcome',
      name: AppRouterConstants.welcome,
      builder: (context, state) {
        return WelcomeScreen();
      },
    ),

    // Recovery screen
    GoRoute(
      path: '/recovery',
      name: AppRouterConstants.recovery,
      builder: (context, state) {
        return RecoveryScreen();
      },
    ),

    // Reminders Screen
    GoRoute(
      path: '/reminders',
      name: AppRouterConstants.reminders,
      builder: (context, state) {
        return RemindersScreen();
      },
    ),

    // Language Select Screen
    GoRoute(
      path: '/languageSelect',
      name: AppRouterConstants.languageSelect,
      builder: (context, state) {
        return LanguageSelectScreen();
      },
    ),

    // Bottom Nav
    GoRoute(
      path: '/bottomNav',
      name: AppRouterConstants.bottomNav,
      builder: (context, state) {
        return BottomNav();
      },
    ),

    // Personal Info Screen
    GoRoute(
      path: '/personalInfo',
      name: AppRouterConstants.personalInfo,
      builder: (context, state) {
        return PersonalInfoScreen();
      },
    ),

    // FAQ Screen
    GoRoute(
      path: '/faq',
      name: AppRouterConstants.faq,
      builder: (context, state) {
        return FaqScreen();
      },
    ),

    // About Screen
    GoRoute(
      path: '/aboutUs',
      name: AppRouterConstants.aboutUs,
      builder: (context, state) {
        return AboutUsScreen();
      },
    ),

    // Audio Screen
    GoRoute(
      path: '/audio',
      name: AppRouterConstants.audio,
      builder: (context, state) {
        return AudioScreen();
      },
    ),

    // Yoga Level SubTitle Screen
    GoRoute(
      path: '/yogaLevelSubTitle',
      name: AppRouterConstants.yogaLevelSubTitle,
      builder: (context, state) {
        return YogaLevelSubTitleScreen();
      },
    ),

    // Yoga Description Screen
    GoRoute(
      path: '/yogaDescription',
      name: AppRouterConstants.yogaDescription,
      builder: (context, state) {
        return YogaDescriptionScreen();
      },
    ),
  ],
);
