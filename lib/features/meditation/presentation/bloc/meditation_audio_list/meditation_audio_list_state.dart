part of 'meditation_audio_list_bloc.dart';

sealed class MeditationAudioListState extends Equatable {
  const MeditationAudioListState();
}

final class MeditationAudioListInitial extends MeditationAudioListState {
  @override
  List<Object> get props => [];
}

final class GetMeditationAudioListLoading extends MeditationAudioListState {
  @override
  List<Object> get props => [];
}

final class GetMeditationAudioListSuccess extends MeditationAudioListState {
  final MeditationAudioListEntity audios;

  const GetMeditationAudioListSuccess({required this.audios});

  @override
  // TODO: implement props
  List<Object?> get props => [audios];
}

final class GetMeditationAudioListFailure extends MeditationAudioListState {
  final String message;

  const GetMeditationAudioListFailure({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
