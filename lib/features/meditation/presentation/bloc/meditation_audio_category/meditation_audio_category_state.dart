part of 'meditation_audio_category_bloc.dart';

sealed class MeditationAudioCategoryState extends Equatable {
  const MeditationAudioCategoryState();
}

final class MeditationAudioCategoryInitial
    extends MeditationAudioCategoryState {
  @override
  List<Object> get props => [];
}

// ================== Meditation States ==================

final class MeditationAudioCategoryLoading
    extends MeditationAudioCategoryState {
  @override
  List<Object> get props => [];
}

final class MeditationAudioCategorySuccess
    extends MeditationAudioCategoryState {
  final MeditationAudioCategoryEntity meditationAudioCategory;

  const MeditationAudioCategorySuccess({required this.meditationAudioCategory});

  @override
  List<Object?> get props => [meditationAudioCategory];
}

final class MeditationAudioCategoryFailure
    extends MeditationAudioCategoryState {
  final String message;

  const MeditationAudioCategoryFailure({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}


