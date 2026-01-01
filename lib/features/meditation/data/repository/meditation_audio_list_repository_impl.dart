import 'package:meditation_app/core/utils/logger_utils.dart';
import 'package:meditation_app/features/meditation/data/data_source/local/meditation_audio_list_local_data_source.dart';
import 'package:meditation_app/features/meditation/data/data_source/remote/meditation_audio_list_remote_data_source.dart';
import 'package:meditation_app/features/meditation/domain/entities/meditation_audio_list_entity.dart';
import 'package:meditation_app/features/meditation/domain/repository/meditation_audio_list_repository.dart';

class MeditationAudioListRepositoryImpl
    implements MeditationAudioListRepository {
  final MeditationAudioListRemoteDataSource meditationAudioListRemoteDataSource;
  final MeditationAudioListLocalDataSource meditationAudioListLocalDataSource;

  MeditationAudioListRepositoryImpl({
    required this.meditationAudioListRemoteDataSource,
    required this.meditationAudioListLocalDataSource,
  });

  @override
  Future<MeditationAudioListEntity> getMeditationAudios({
    required String userId,
    required String categoryName,
  }) async {
    try {
      final localData = await meditationAudioListLocalDataSource
          .getMeditationAudioList();

      if (localData != null) {
        return localData;
      }

      final remoteData = await meditationAudioListRemoteDataSource
          .getMeditationAudios(userId: userId, categoryName: categoryName);

      // Save to Local
      await meditationAudioListLocalDataSource.saveMeditationAudioList(
        remoteData,
      );

      LoggerUtils.logInfo("💾 Meditation Audio List saved to cache");

      return remoteData;
    } catch (e) {
      LoggerUtils.logError("❌ Failed to get Meditation Audio List: $e");
      rethrow;
    }
  }
}
