import 'package:meditation_app/core/service/graphql_service.dart';
import 'package:meditation_app/features/auth/data/models/email_auth_login_model.dart';
import 'package:meditation_app/features/auth/data/models/email_auth_register_model.dart';

class EmailAuthDataSource {
  final GraphQLService graphQLService;

  EmailAuthDataSource({required this.graphQLService});

  // Register With Email
  Future<EmailAuthRegisterModel> registerWithEmail({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
    required String profileImage,
  }) async {
    final result = await graphQLService.performMutation(''' 
    
    mutation Register_user {
  register_user(
    first_name: "$firstName"
    email: "$email"
    password: "$password"
    confirm_password:"$confirmPassword"
    phone_number: "$phoneNumber"
    last_name: "$lastName"
    profile_image: "$profileImage"
  ) {
    message
    success
  }
}
    
''');

    final data = result.data!['register_user'];
    return EmailAuthRegisterModel.fromJson(data);
  }

  // Login With Email
  Future<EmailAuthLoginModel> loginWithEmail({
    required String email,
    required String password,
  }) async {
    final result = await graphQLService.performQuery(''' 
    
    query Login_user {
  login_user(email: "$email", password: "$password") {
    token
    user
  }
}

    ''');

    final data = result.data!['login_user'];
    return EmailAuthLoginModel.fromJson(data);
  }
}
