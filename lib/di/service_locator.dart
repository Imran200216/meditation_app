import 'package:get_it/get_it.dart';
import 'package:meditation_app/core/bloc/connectivity/connectivity_bloc.dart';
import 'package:meditation_app/core/constants/app_api_constants.dart';
import 'package:meditation_app/core/service/graphql_service.dart';
import 'package:meditation_app/features/auth/auth_injection.dart';
import 'package:meditation_app/features/bottom_nav/bottom_nav_injection.dart';
import 'package:meditation_app/features/recovery/recovery_injection.dart';

final GetIt getIt = GetIt.instance;

void serviceLocator() {
  // Graphql Service
  getIt.registerSingletonAsync<GraphQLService>(() async {
    final service = GraphQLService();
    await service.init(httpEndpoint: AppApiConstants.baseUrl);
    return service;
  });

  // Connectivity
  getIt.registerLazySingleton(() => ConnectivityBloc());

  // Auth Injection
  initAuthInjection();

  // Recovery
  initRecoveryInjection();

  // Bottom Nav
  initBottomNavInjection();
}
