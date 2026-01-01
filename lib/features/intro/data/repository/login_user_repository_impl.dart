import 'package:meditation_app/core/utils/logger_utils.dart';
import 'package:meditation_app/features/intro/data/data_source/remote/login_remote_data_source.dart';
import 'package:meditation_app/features/intro/domain/entities/login_entity.dart';
import 'package:meditation_app/features/intro/domain/repository/login_user_repository.dart';

class LoginUserRepositoryImpl implements LoginUserRepository {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginUserRepositoryImpl({required this.loginRemoteDataSource});

  @override
  Future<LoginEntity> login({
    required String firebaseUID,
    required String email,
    required String firstName,
  }) async {
    try {
      final result = await loginRemoteDataSource.login(
        firebaseUID: firebaseUID,
        email: email,
        firstName: firstName,
      );

      LoggerUtils.logInfo("Login successful: $result");
      return result;
    } catch (e, stackTrace) {
      LoggerUtils.logError("Failed to login: $e");
      throw Exception('Login failed');
    }
  }
}
