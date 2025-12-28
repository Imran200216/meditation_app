import 'package:meditation_app/core/service/graphql_service.dart';
import 'package:meditation_app/features/auth/data/models/user_model.dart';

class GetUserRemoteDataSource {
  final GraphQLService graphQLService;

  GetUserRemoteDataSource({required this.graphQLService});

  // Get User By Id Auth
  Future<UserModel> getUserBYIdAuth({required String id}) async {
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

    final data = result.data!['get_user_by_id_auth'];

    return UserModel.fromJson(data);
  }
}
