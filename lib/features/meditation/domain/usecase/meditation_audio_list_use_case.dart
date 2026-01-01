import 'package:meditation_app/features/meditation/domain/entities/meditation_audio_list_entity.dart';
import 'package:meditation_app/features/meditation/domain/repository/meditation_audio_list_repository.dart';

class MeditationAudioListUseCase {
  final MeditationAudioListRepository meditationAudioListRepository;

  MeditationAudioListUseCase({required this.meditationAudioListRepository});

  Future<MeditationAudioListEntity> call({
    required String userId,
    required String categoryName,
  }) {
    return meditationAudioListRepository.getMeditationAudios(
      userId: userId,
      categoryName: categoryName,
    );
  }
}
