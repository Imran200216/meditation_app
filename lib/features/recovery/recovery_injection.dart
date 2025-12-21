import 'package:get_it/get_it.dart';
import 'package:meditation_app/features/recovery/presentation/cubit/recovery_select/recovery_select_cubit.dart';

final GetIt getIt = GetIt.instance;

void initRecoveryInjection() {
  // Cubit
  getIt.registerFactory<RecoverySelectCubit>(() => RecoverySelectCubit());
}
