import 'package:equatable/equatable.dart';

class MeditationAudioEntity extends Equatable {
  final String id;
  final String category;
  final String description;

  const MeditationAudioEntity({
    required this.id,
    required this.category,
    required this.description,
  });

  @override
  List<Object?> get props => [id, category, description];
}

class MeditationAudioListEntity extends Equatable {
  final List<MeditationAudioEntity> audios;

  const MeditationAudioListEntity({required this.audios});

  @override
  List<Object?> get props => [audios];
}
