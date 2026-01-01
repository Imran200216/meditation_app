import 'package:meditation_app/features/meditation/domain/entities/meditation_audio_category_entity.dart';

abstract class MeditationAudioCategoryRepository {
  Future<MeditationAudioCategoryEntity> getMeditationAudioCategories({
    required String userId,
  });
}
