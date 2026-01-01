import 'package:meditation_app/features/meditation/domain/entities/meditation_audio_list_entity.dart';

abstract class MeditationAudioListRepository {
  Future<MeditationAudioListEntity> getMeditationAudios({
    required String userId,
    required String categoryName,
  });
}
