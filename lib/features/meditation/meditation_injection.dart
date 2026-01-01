import 'package:get_it/get_it.dart';
import 'package:meditation_app/core/service/graphql_service.dart';
import 'package:meditation_app/features/meditation/data/data_source/local/meditation_audio_category_local_data_source.dart';
import 'package:meditation_app/features/meditation/data/data_source/local/meditation_audio_list_local_data_source.dart';
import 'package:meditation_app/features/meditation/data/data_source/remote/meditation_audio_category_remote_data_source.dart';
import 'package:meditation_app/features/meditation/data/data_source/remote/meditation_audio_list_remote_data_source.dart';
import 'package:meditation_app/features/meditation/data/repository/meditation_audio_category_repository_impl.dart';
import 'package:meditation_app/features/meditation/data/repository/meditation_audio_list_repository_impl.dart';
import 'package:meditation_app/features/meditation/domain/repository/meditation_audio_category_repository.dart';
import 'package:meditation_app/features/meditation/domain/repository/meditation_audio_list_repository.dart';
import 'package:meditation_app/features/meditation/domain/usecase/meditation_audio_category_use_case.dart';
import 'package:meditation_app/features/meditation/domain/usecase/meditation_audio_list_use_case.dart';
import 'package:meditation_app/features/meditation/presentation/bloc/meditation_audio_category/meditation_audio_category_bloc.dart';
import 'package:meditation_app/features/meditation/presentation/bloc/meditation_audio_list/meditation_audio_list_bloc.dart';

final GetIt getIt = GetIt.instance;

void initMeditationInjection() {
  // ---------------- Data Source ----------------
  getIt.registerLazySingleton(
    () => MeditationAudioCategoryRemoteDataSource(
      graphQLService: getIt<GraphQLService>(),
    ),
  );

  getIt.registerLazySingleton(() => MeditationAudioCategoryLocalDataSource());

  getIt.registerLazySingleton(
    () => MeditationAudioListRemoteDataSource(
      graphQLService: getIt<GraphQLService>(),
    ),
  );

  getIt.registerLazySingleton(() => MeditationAudioListLocalDataSource());

  // ---------------- Repository ----------------
  getIt.registerLazySingleton<MeditationAudioCategoryRepository>(
    () => MeditationAudioCategoryRepositoryImpl(
      meditationAudioCategoryLocalDataSource:
          getIt<MeditationAudioCategoryLocalDataSource>(),
      meditationAudioCategoryRemoteDataSource:
          getIt<MeditationAudioCategoryRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<MeditationAudioListRepository>(
    () => MeditationAudioListRepositoryImpl(
      meditationAudioListRemoteDataSource:
          getIt<MeditationAudioListRemoteDataSource>(),
      meditationAudioListLocalDataSource:
          getIt<MeditationAudioListLocalDataSource>(),
    ),
  );

  // ---------------- Use Case ----------------
  getIt.registerLazySingleton(
    () => MeditationAudioCategoryUseCase(
      meditationAudioCategoryRepository:
          getIt<MeditationAudioCategoryRepository>(),
    ),
  );

  getIt.registerLazySingleton(
    () => MeditationAudioListUseCase(
      meditationAudioListRepository: getIt<MeditationAudioListRepository>(),
    ),
  );

  // ---------------- Bloc ----------------
  getIt.registerFactory(
    () => MeditationAudioCategoryBloc(
      meditationAudioCategoryUseCase: getIt<MeditationAudioCategoryUseCase>(),
    ),
  );

  getIt.registerFactory(
    () => MeditationAudioListBloc(
      meditationAudioListUseCase: getIt<MeditationAudioListUseCase>(),
    ),
  );
}
