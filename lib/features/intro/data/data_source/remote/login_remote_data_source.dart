import 'package:meditation_app/core/service/graphql_service.dart';
import 'package:meditation_app/core/utils/logger_utils.dart';
import 'package:meditation_app/features/intro/data/models/login_model.dart';
import 'package:meditation_app/features/intro/domain/entities/login_entity.dart';

class LoginRemoteDataSource {
  final GraphQLService graphQLService;

  LoginRemoteDataSource({required this.graphQLService});

  Future<LoginEntity> login({
    required String firebaseUID,
    required String email,
    required String firstName,
  }) async {
    try {
      final result = await graphQLService.performQuery(''' 
        query Query {
  fire_base_login(firebase_uid: "$firebaseUID", first_name: "$firstName", email: "$email") {
    user
    token
  }
}

      ''');

      LoggerUtils.logInfo("💡 GraphQL query executed successfully : $result");

      final data = result.data?['fire_base_login'];

      if (data == null) {
        LoggerUtils.logError(
          "⛔ GraphQL query returned null data for user id: $data",
        );
        throw Exception("User data is null");
      }

      LoggerUtils.logInfo("💡 GraphQL response data: $data");

      return LoginModel.fromJson(data);
    } catch (e) {
      LoggerUtils.logError("⛔ Error executing GraphQL query: ${e.toString()}");
      rethrow;
    }
  }
}
