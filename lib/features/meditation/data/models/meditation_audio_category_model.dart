import 'package:meditation_app/core/utils/logger_utils.dart';
import 'package:meditation_app/features/meditation/domain/entities/meditation_audio_category_entity.dart';

class MeditationAudioCategoryModel extends MeditationAudioCategoryEntity {
  MeditationAudioCategoryModel({required super.categories});

  factory MeditationAudioCategoryModel.fromJson(Map<String, dynamic> json) {
    LoggerUtils.logInfo('Raw JSON: $json'); // Debug print

    // Handle the 'data' wrapper
    final data = json['data'] ?? json;
    final categoryList =
        data['list_all_meditation_audio_category'] as List<dynamic>;

    print('Category List: $categoryList'); // Debug print

    final categories = categoryList
        .map((item) => item['category'] as String)
        .toList();

    print('Parsed categories: $categories'); // Debug print

    return MeditationAudioCategoryModel(categories: categories);
  }

  Map<String, dynamic> toJson() {
    return {
      'data': {
        'list_all_meditation_audio_category': categories
            .map((category) => {'category': category})
            .toList(),
      },
    };
  }
}
