import 'package:get_it/get_it.dart';
import 'package:meditation_app/core/service/graphql_service.dart';
import 'package:meditation_app/features/auth/data/datasource/email_auth_data_source.dart';
import 'package:meditation_app/features/auth/data/repository/email_auth_repository_impl.dart';
import 'package:meditation_app/features/auth/domain/repository/email_auth_repository.dart';
import 'package:meditation_app/features/auth/domain/usecase/login_with_email_use_case.dart';
import 'package:meditation_app/features/auth/domain/usecase/register_with_email_usecase.dart';
import 'package:meditation_app/features/auth/presentation/bloc/email_auth/email_auth_bloc.dart';

final GetIt getIt = GetIt.instance;

void initAuthInjection() {
  // ---------------- Data Source ----------------
  getIt.registerLazySingleton(
    () => EmailAuthDataSource(graphQLService: getIt<GraphQLService>()),
  );

  // ---------------- Repository ----------------
  getIt.registerLazySingleton<EmailAuthRepository>(
    () => EmailAuthRepositoryImpl(
      emailAuthDataSource: getIt<EmailAuthDataSource>(),
    ),
  );

  // ---------------- Use Case ----------------
  getIt.registerLazySingleton(
    () => RegisterWithEmailUseCase(
      emailAuthRepository: getIt<EmailAuthRepository>(),
    ),
  );
  getIt.registerLazySingleton(
    () => LoginWithEmailUseCase(
      emailAuthRepository: getIt<EmailAuthRepository>(),
    ),
  );

  // ---------------- Bloc ----------------
  getIt.registerFactory(
    () => EmailAuthBloc(
      registerWithEmailUseCase: getIt<RegisterWithEmailUseCase>(),
      loginWithEmailUseCase: getIt<LoginWithEmailUseCase>(),
    ),
  );
}
