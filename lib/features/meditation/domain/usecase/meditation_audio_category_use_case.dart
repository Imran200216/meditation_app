import 'package:meditation_app/features/meditation/domain/entities/meditation_audio_category_entity.dart';
import 'package:meditation_app/features/meditation/domain/repository/meditation_audio_category_repository.dart';

class MeditationAudioCategoryUseCase {
  final MeditationAudioCategoryRepository meditationAudioCategoryRepository;

  MeditationAudioCategoryUseCase({
    required this.meditationAudioCategoryRepository,
  });

  Future<MeditationAudioCategoryEntity> call({
    required String userId,
  }) async {
    final model = await meditationAudioCategoryRepository
        .getMeditationAudioCategories(userId: userId);

    return model;
  }
}
