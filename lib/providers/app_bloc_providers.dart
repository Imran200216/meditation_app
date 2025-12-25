import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meditation_app/features/bottom_nav/bottom_nav.dart';
import 'package:meditation_app/features/recovery/recovery.dart';

final GetIt getIt = GetIt.instance;

List<BlocProvider> appBlocProvider = [
  // Recovery Select Cubit
  BlocProvider<RecoverySelectCubit>(
    create: (context) => getIt<RecoverySelectCubit>(),
  ),

  BlocProvider<BottomNavCubit>(create: (context) => getIt<BottomNavCubit>()),
];
