import 'package:meditation_app/core/service/graphql_service.dart';
import 'package:meditation_app/core/utils/logger_utils.dart';
import 'package:meditation_app/features/meditation/data/models/meditation_audio_list_model.dart';

class MeditationAudioListRemoteDataSource {
  final GraphQLService graphQLService;

  MeditationAudioListRemoteDataSource({required this.graphQLService});

  Future<MeditationAudioListModel> getMeditationAudios({
    required String userId,
    required String categoryName,
  }) async {
    try {
      final result = await graphQLService.performQuery('''
      
      query View_meditation_audio_by_category {
  view_meditation_audio_by_category(user_id: "$userId", category_name: "$categoryName") {
    category
    id
    description
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

      return MeditationAudioListModel.fromJson(data);
    } catch (e) {
      LoggerUtils.logError("⛔ Error executing GraphQL query: ${e.toString()}");
      rethrow;
    }
  }
}
