import 'package:get_it/get_it.dart';
import 'package:meditation_app/features/bottom_nav/bottom_nav_injection.dart';
import 'package:meditation_app/features/recovery/recovery_injection.dart';

final GetIt getIt = GetIt.instance;

void serviceLocator() {
  // Language

  // Recovery
  initRecoveryInjection();

  // Bottom Nav
  initBottomNavInjection();
}
