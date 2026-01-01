import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meditation_app/core/bloc/connectivity/connectivity_bloc.dart';
import 'package:meditation_app/features/bottom_nav/presentation/cubit/bottom_nav/bottom_nav_cubit.dart';
import 'package:meditation_app/features/intro/presentation/bloc/get_user_auth_details/get_user_auth_details_bloc.dart';
import 'package:meditation_app/features/intro/presentation/bloc/login/login_bloc.dart';
import 'package:meditation_app/features/meditation/presentation/bloc/meditation_audio_category/meditation_audio_category_bloc.dart';
import 'package:meditation_app/features/meditation/presentation/bloc/meditation_audio_list/meditation_audio_list_bloc.dart';
import 'package:meditation_app/features/recovery/presentation/cubit/recovery_select/recovery_select_cubit.dart';

final GetIt getIt = GetIt.instance;

List<BlocProvider> appBlocProvider = [
  // Recovery Select Cubit
  BlocProvider<RecoverySelectCubit>(
    create: (context) => getIt<RecoverySelectCubit>(),
  ),

  // Bottom Nav Cubit
  BlocProvider<BottomNavCubit>(create: (context) => getIt<BottomNavCubit>()),

  // Connectivity Bloc
  BlocProvider<ConnectivityBloc>(
    create: (context) => getIt<ConnectivityBloc>(),
  ),

  // Login Bloc
  BlocProvider<LoginBloc>(create: (context) => getIt<LoginBloc>()),

  // Get User Auth Bloc
  BlocProvider<GetUserAuthDetailsBloc>(
    create: (context) => getIt<GetUserAuthDetailsBloc>(),
  ),

  // Meditation Audio Category Bloc
  BlocProvider<MeditationAudioCategoryBloc>(
    create: (context) => getIt<MeditationAudioCategoryBloc>(),
  ),

  // Meditation Audio List Bloc
  BlocProvider<MeditationAudioListBloc>(
    create: (context) => getIt<MeditationAudioListBloc>(),
  ),
];
