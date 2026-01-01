part of 'meditation_audio_list_bloc.dart';

sealed class MeditationAudioListEvent extends Equatable {
  const MeditationAudioListEvent();
}

final class GetMeditationAudioList extends MeditationAudioListEvent {
  final String userId;
  final String categoryName;

  const GetMeditationAudioList({
    required this.userId,
    required this.categoryName,
  });

  @override
  List<Object?> get props => [userId, categoryName];
}
