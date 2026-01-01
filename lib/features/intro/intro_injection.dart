import 'package:get_it/get_it.dart';
import 'package:meditation_app/core/service/graphql_service.dart';
import 'package:meditation_app/features/intro/data/data_source/local/get_user_local_data_source.dart';
import 'package:meditation_app/features/intro/data/data_source/remote/get_user_remote_data_source.dart';
import 'package:meditation_app/features/intro/data/data_source/remote/login_remote_data_source.dart';
import 'package:meditation_app/features/intro/data/repository/get_user_repository_impl.dart';
import 'package:meditation_app/features/intro/data/repository/login_user_repository_impl.dart';
import 'package:meditation_app/features/intro/domain/repository/get_user_repository.dart';
import 'package:meditation_app/features/intro/domain/repository/login_user_repository.dart';
import 'package:meditation_app/features/intro/domain/usecase/get_user_use_case.dart';
import 'package:meditation_app/features/intro/domain/usecase/login_use_case.dart';
import 'package:meditation_app/features/intro/presentation/bloc/get_user_auth_details/get_user_auth_details_bloc.dart';
import 'package:meditation_app/features/intro/presentation/bloc/login/login_bloc.dart';

final GetIt getIt = GetIt.instance;

void initIntroInjection() {
  // ---------------- Data Source ----------------
  getIt.registerLazySingleton(() => GetUserLocalDataSource());

  getIt.registerLazySingleton(
    () => GetUserRemoteDataSource(graphQLService: getIt<GraphQLService>()),
  );

  getIt.registerLazySingleton(
    () => LoginRemoteDataSource(graphQLService: getIt<GraphQLService>()),
  );

  // ---------------- Repository ----------------
  getIt.registerLazySingleton<GetUserRepository>(
    () => GetUserRepositoryImpl(
      getUserRemoteDataSource: getIt<GetUserRemoteDataSource>(),
      getUserLocalDataSource: getIt<GetUserLocalDataSource>(),
    ),
  );

  getIt.registerLazySingleton<LoginUserRepository>(
    () => LoginUserRepositoryImpl(
      loginRemoteDataSource: getIt<LoginRemoteDataSource>(),
    ),
  );

  // ---------------- Use Case ----------------
  getIt.registerLazySingleton(
    () => GetUserUseCase(getUserRepository: getIt<GetUserRepository>()),
  );

  getIt.registerLazySingleton(
    () => LoginUseCase(loginUserRepository: getIt<LoginUserRepository>()),
  );

  // ---------------- Bloc ----------------
  getIt.registerFactory(
    () => GetUserAuthDetailsBloc(getUserUseCase: getIt<GetUserUseCase>()),
  );

  getIt.registerFactory(() => LoginBloc(loginUseCase: getIt<LoginUseCase>()));
}
