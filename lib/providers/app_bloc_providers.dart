import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meditation_app/core/bloc/connectivity/connectivity_bloc.dart';
import 'package:meditation_app/features/auth/domain/usecase/get_user_use_case.dart';
import 'package:meditation_app/features/auth/domain/usecase/login_with_email_use_case.dart';
import 'package:meditation_app/features/auth/domain/usecase/register_with_email_usecase.dart';
import 'package:meditation_app/features/auth/presentation/bloc/email_auth/email_auth_bloc.dart';
import 'package:meditation_app/features/auth/presentation/bloc/get_user_auth_details/get_user_auth_details_bloc.dart';
import 'package:meditation_app/features/bottom_nav/presentation/cubit/bottom_nav/bottom_nav_cubit.dart';
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

  // Email Auth Bloc
  BlocProvider<EmailAuthBloc>(
    create: (context) => EmailAuthBloc(
      registerWithEmailUseCase: getIt<RegisterWithEmailUseCase>(),
      loginWithEmailUseCase: getIt<LoginWithEmailUseCase>(),
    ),
  ),

  // Get User Auth Details Bloc
  BlocProvider<GetUserAuthDetailsBloc>(
    create: (context) =>
        GetUserAuthDetailsBloc(getUserUseCase: getIt<GetUserUseCase>()),
  ),
];
