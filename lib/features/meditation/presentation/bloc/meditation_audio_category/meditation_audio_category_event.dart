part of 'meditation_audio_category_bloc.dart';

sealed class MeditationAudioCategoryEvent extends Equatable {
  const MeditationAudioCategoryEvent();
}

final class GetMeditationAudioCategoryEvent
    extends MeditationAudioCategoryEvent {
  final String userId;

  const GetMeditationAudioCategoryEvent({required this.userId});

  @override
  List<Object> get props => [userId];
}
