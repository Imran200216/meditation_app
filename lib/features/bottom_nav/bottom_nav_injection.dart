import 'package:get_it/get_it.dart';
import 'package:meditation_app/features/bottom_nav/presentation/cubit/bottom_nav/bottom_nav_cubit.dart';

final GetIt getIt = GetIt.instance;

void initBottomNavInjection() {
  // Bottom Nav Cubit
  getIt.registerFactory(() => BottomNavCubit());
}
