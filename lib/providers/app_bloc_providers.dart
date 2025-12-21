import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meditation_app/features/bottom_nav/presentation/cubit/bottom_nav/bottom_nav_cubit.dart';
import 'package:meditation_app/features/recovery/presentation/cubit/recovery_select/recovery_select_cubit.dart';

final GetIt getIt = GetIt.instance;

List<BlocProvider> appBlocProvider = [
  // Recovery Select Cubit
  BlocProvider<RecoverySelectCubit>(
    create: (context) => getIt<RecoverySelectCubit>(),
  ),

  BlocProvider<BottomNavCubit>(create: (context) => getIt<BottomNavCubit>()),
];
