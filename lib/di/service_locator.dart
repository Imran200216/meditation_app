import 'package:get_it/get_it.dart';
import 'package:meditation_app/features/bottom_nav/bottom_nav.dart';
import 'package:meditation_app/features/recovery/recovery.dart';

final GetIt getIt = GetIt.instance;

void serviceLocator() {
  // Language

  // Recovery
  initRecoveryInjection();

  // Bottom Nav
  initBottomNavInjection();
}
