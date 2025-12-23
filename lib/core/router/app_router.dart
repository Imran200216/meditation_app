import 'package:go_router/go_router.dart';
import 'package:meditation_app/core/constants/app_router_constants.dart';
import 'package:meditation_app/features/about_us/presentation/screens/about_us_screen.dart';
import 'package:meditation_app/features/auth/presentation/screens/auth_sign_in_screen.dart';
import 'package:meditation_app/features/auth/presentation/screens/auth_sign_up_screen.dart';
import 'package:meditation_app/features/bottom_nav/presentation/screens/bottom_nav.dart';
import 'package:meditation_app/features/faq/presentation/screens/faq_screen.dart';
import 'package:meditation_app/features/intro/presentation/screens/intro_screen.dart';
import 'package:meditation_app/features/language/presentation/screens/language_select_screen.dart';
import 'package:meditation_app/features/personal_info/presentation/screens/personal_info_screen.dart';
import 'package:meditation_app/features/recovery/presentation/screens/recovery_screen.dart';
import 'package:meditation_app/features/reminders/presentation/screens/reminders_screen.dart';
import 'package:meditation_app/features/splash/presentation/screens/splash_screen.dart';
import 'package:meditation_app/features/welcome/presentation/screens/welcome_screen.dart';

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
  ],
);
