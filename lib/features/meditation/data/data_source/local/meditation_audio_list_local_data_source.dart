import 'package:meditation_app/core/constants/app_db_constants.dart';
import 'package:meditation_app/core/service/hive_service.dart';
import 'package:meditation_app/features/meditation/data/models/meditation_audio_list_model.dart';

class MeditationAudioListLocalDataSource {
  static const String _boxName = AppDbConstants.meditationAudioCategoryBox;
  static const String _meditationAudioListKey =
      AppDbConstants.meditationAudioListKey;

  /// Save Meditation Audio Category Locally
  Future<void> saveMeditationAudioList(
    MeditationAudioListModel meditationAudioList,
  ) async {
    await HiveService.saveData(
      boxName: _boxName,
      key: _meditationAudioListKey,
      value: meditationAudioList.toJson(),
    );
  }

  /// Get Meditation Audio Category From Local Storage
  Future<MeditationAudioListModel?> getMeditationAudioList() async {
    final data = await HiveService.getData(
      boxName: _boxName,
      key: _meditationAudioListKey,
    );

    if (data == null) return null;

    try {
      // Convert outer map safely
      final Map<String, dynamic> safeData = Map<String, dynamic>.from(data);

      // Convert inner list safely
      if (safeData['data']?['view_meditation_audio_by_category'] != null) {
        final list =
            safeData['data']['view_meditation_audio_by_category'] as List;
        safeData['data']['view_meditation_audio_by_category'] = list
            .map((e) => Map<String, dynamic>.from(e as Map))
            .toList();
      }

      return MeditationAudioListModel.fromJson(safeData);
    } catch (e) {
      // Clear corrupt cache
      await clearMeditationAudioList();
      return null;
    }
  }

  /// Clear Meditation Category Cache
  Future<void> clearMeditationAudioList() async {
    await HiveService.deleteData(
      boxName: _boxName,
      key: _meditationAudioListKey,
    );
  }
}
