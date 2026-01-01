import 'package:meditation_app/core/constants/app_db_constants.dart';
import 'package:meditation_app/core/service/hive_service.dart';
import 'package:meditation_app/features/meditation/data/models/meditation_audio_category_model.dart';

class MeditationAudioCategoryLocalDataSource {
  static const String _boxName = AppDbConstants.meditationAudioCategoryBox;
  static const String _meditationAudioCategoryKey =
      AppDbConstants.meditationAudioCategoryKey;

  /// Save Meditation Audio Category Locally
  Future<void> saveMeditationAudioCategory(
    MeditationAudioCategoryModel meditationAudioCategory,
  ) async {
    await HiveService.saveData(
      boxName: _boxName,
      key: _meditationAudioCategoryKey,
      value: meditationAudioCategory.toJson(),
    );
  }

  /// Get Meditation Audio Category From Local Storage
  Future<MeditationAudioCategoryModel?> getMeditationAudioCategory() async {
    final data = await HiveService.getData(
      boxName: _boxName,
      key: _meditationAudioCategoryKey,
    );

    if (data == null) return null;

    try {
      // Convert outer map safely
      final Map<String, dynamic> safeData = Map<String, dynamic>.from(data);

      // Convert inner list safely
      final innerList =
          safeData['data']?['list_all_meditation_audio_category'] as List?;
      if (innerList != null) {
        safeData['data']['list_all_meditation_audio_category'] = innerList
            .map((item) => Map<String, dynamic>.from(item as Map))
            .toList();
      }

      return MeditationAudioCategoryModel.fromJson(safeData);
    } catch (e) {
      // If anything fails, clear the corrupt cache and return null
      await clearMeditationAudioCategory();
      return null;
    }
  }

  /// Clear Meditation Category Cache
  Future<void> clearMeditationAudioCategory() async {
    await HiveService.deleteData(
      boxName: _boxName,
      key: _meditationAudioCategoryKey,
    );
  }
}
