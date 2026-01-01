import 'package:meditation_app/core/utils/logger_utils.dart';
import 'package:meditation_app/features/meditation/data/data_source/local/meditation_audio_category_local_data_source.dart';
import 'package:meditation_app/features/meditation/data/data_source/remote/meditation_audio_category_remote_data_source.dart';
import 'package:meditation_app/features/meditation/domain/entities/meditation_audio_category_entity.dart';
import 'package:meditation_app/features/meditation/domain/repository/meditation_audio_category_repository.dart';

class MeditationAudioCategoryRepositoryImpl
    implements MeditationAudioCategoryRepository {
  final MeditationAudioCategoryLocalDataSource
  meditationAudioCategoryLocalDataSource;
  final MeditationAudioCategoryRemoteDataSource
  meditationAudioCategoryRemoteDataSource;

  MeditationAudioCategoryRepositoryImpl({
    required this.meditationAudioCategoryLocalDataSource,
    required this.meditationAudioCategoryRemoteDataSource,
  });

  @override
  Future<MeditationAudioCategoryEntity> getMeditationAudioCategories({
    required String userId,
  }) async {
    try {
      final localData = await meditationAudioCategoryLocalDataSource
          .getMeditationAudioCategory();

      if (localData != null) {
        LoggerUtils.logInfo("✅ Meditation Audio Category loaded from cache");

        return localData;
      }

      final remoteData = await meditationAudioCategoryRemoteDataSource
          .getMeditationAudioCategories(userId: userId);

      // Save to Local
      await meditationAudioCategoryLocalDataSource.saveMeditationAudioCategory(
        remoteData,
      );
      LoggerUtils.logInfo("💾 Meditation Audio Category saved to cache");

      return remoteData;
    } catch (e) {
      LoggerUtils.logError("❌ Failed to get Meditation Audio Category: $e");
      rethrow;
    }
  }
}
