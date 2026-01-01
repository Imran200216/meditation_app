import 'package:meditation_app/features/meditation/domain/entities/meditation_audio_list_entity.dart';

class MeditationAudioListModel extends MeditationAudioListEntity {
  const MeditationAudioListModel({required super.audios});

  /// ✅ Convert JSON (GraphQL or cached Hive) to Model
  factory MeditationAudioListModel.fromJson(Map<String, dynamic> json) {
    print('=== PARSING MEDITATION AUDIO LIST ===');
    print('Raw JSON keys: ${json.keys}');

    List<dynamic> audioList = [];

    // GraphQL response with 'data' wrapper
    if (json.containsKey('data') &&
        json['data'] is Map<String, dynamic> &&
        json['data']['view_meditation_audio_by_category'] != null) {
      audioList =
          json['data']['view_meditation_audio_by_category'] as List<dynamic>;
      print('✅ Found GraphQL format, items: ${audioList.length}');
    }
    // Hive cached JSON with inner list
    else if (json.containsKey('view_meditation_audio_by_category') &&
        json['view_meditation_audio_by_category'] is List<dynamic>) {
      audioList = json['view_meditation_audio_by_category'] as List<dynamic>;
      print('✅ Found Hive format, items: ${audioList.length}');
    } else {
      print('❌ No matching format found!');
      print('JSON structure: $json');
    }

    final audios = audioList.map((item) {
      final map = item as Map<String, dynamic>;
      return MeditationAudioEntity(
        id: map['id'] ?? '',
        category: map['category'] ?? '',
        description: map['description'] ?? '',
      );
    }).toList();

    print('✅ Parsed ${audios.length} audio items');
    print('First item: ${audios.isNotEmpty ? audios.first : "none"}');

    return MeditationAudioListModel(audios: audios);
  }

  /// ✅ Convert Model to JSON (store only inner list in Hive)
  Map<String, dynamic> toJson() {
    return {
      'view_meditation_audio_by_category': audios.map((audio) {
        return {
          'id': audio.id,
          'category': audio.category,
          'description': audio.description,
        };
      }).toList(),
    };
  }

  @override
  String toString() => 'MeditationAudioListModel(audios: $audios)';
}
