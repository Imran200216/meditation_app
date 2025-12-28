import 'package:meditation_app/core/service/graphql_service.dart';
import 'package:meditation_app/features/auth/data/models/user_model.dart';
import 'package:meditation_app/core/utils/logger_utils.dart';

class GetUserRemoteDataSource {
  final GraphQLService graphQLService;

  GetUserRemoteDataSource({required this.graphQLService});

  // Get User By Id Auth
  Future<UserModel> getUserBYIdAuth({required String id}) async {
    LoggerUtils.logInfo(
      "💡 Executing GraphQL query to fetch user with id: $id",
    );

    try {
      final result = await graphQLService.performQuery(''' 
        query Get_user_by_id_auth {
          get_user_by_id_auth(user_id: "$id") {
            id
            profile_image
            first_name
            last_name
            email
            phone_number
          }
        }
      ''');

      LoggerUtils.logInfo("💡 GraphQL query executed successfully");

      final data = result.data?['get_user_by_id_auth'];
      if (data == null) {
        LoggerUtils.logError(
          "⛔ GraphQL query returned null data for user id: $id",
        );
        throw Exception("User data is null");
      }

      LoggerUtils.logInfo("💡 GraphQL response data: $data");

      return UserModel.fromJson(data);
    } catch (e) {
      LoggerUtils.logError("⛔ Error executing GraphQL query: ${e.toString()}");
      rethrow;
    }
  }
}
