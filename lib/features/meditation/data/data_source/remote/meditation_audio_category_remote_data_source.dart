import 'package:meditation_app/core/service/graphql_service.dart';
import 'package:meditation_app/core/utils/logger_utils.dart';
import 'package:meditation_app/features/meditation/data/models/meditation_audio_category_model.dart';

class MeditationAudioCategoryRemoteDataSource {
  final GraphQLService graphQLService;

  MeditationAudioCategoryRemoteDataSource({required this.graphQLService});

  Future<MeditationAudioCategoryModel> getMeditationAudioCategories({
    required String userId,
  }) async {
    try {
      final result = await graphQLService.performQuery('''
        query List_all_meditation_audio_category {
          list_all_meditation_audio_category(user_id: "$userId") {
            category
          }
        }
      ''');

      LoggerUtils.logInfo("💡 GraphQL query executed successfully: $result");

      // Pass the full `data` map, not just the inner list
      final data = result.data;

      if (data == null) {
        LoggerUtils.logError("⛔ GraphQL query returned null data");
        throw Exception("No data received from GraphQL");
      }

      LoggerUtils.logInfo("💡 GraphQL response data: $data");

      // Now fromJson can safely read `data['data']['list_all_meditation_audio_category']`
      return MeditationAudioCategoryModel.fromJson(data);
    } catch (e) {
      LoggerUtils.logError("⛔ Error executing GraphQL query: ${e.toString()}");
      rethrow;
    }
  }
}
