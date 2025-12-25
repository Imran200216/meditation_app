import 'package:flutter/material.dart';

enum DayPeriod { morning, afternoon, evening, night }

class GreetingUtils {
  static DayPeriod getCurrentDayPeriod() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return DayPeriod.morning;
    } else if (hour >= 12 && hour < 17) {
      return DayPeriod.afternoon;
    } else if (hour >= 17 && hour < 21) {
      return DayPeriod.evening;
    } else {
      return DayPeriod.night;
    }
  }

  /// Lottie selector
  static String getLottieAsset({
    required String morningLottie,
    required String nightLottie,
  }) {
    final period = getCurrentDayPeriod();

    return period == DayPeriod.night ? nightLottie : morningLottie;
  }

  /// Background color selector
  static Color getBackgroundColor({
    Color morningColor = const Color(0xFFFFF8E1), // soft warm
    Color nightColor = const Color(0xFF0D1B2A), // deep night
  }) {
    final period = getCurrentDayPeriod();

    return period == DayPeriod.night ? nightColor : morningColor;
  }

  /// Optional greeting text
  static String getGreetingText() {
    switch (getCurrentDayPeriod()) {
      case DayPeriod.morning:
        return 'Good Morning';
      case DayPeriod.afternoon:
        return 'Good Afternoon';
      case DayPeriod.evening:
        return 'Good Evening';
      case DayPeriod.night:
        return 'Good Night';
    }
  }
}
