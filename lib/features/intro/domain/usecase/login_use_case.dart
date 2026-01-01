import 'package:meditation_app/features/intro/domain/entities/login_entity.dart';
import 'package:meditation_app/features/intro/domain/entities/user_entity.dart';
import 'package:meditation_app/features/intro/domain/repository/login_user_repository.dart';

class LoginUseCase {
  final LoginUserRepository loginUserRepository;

  LoginUseCase({required this.loginUserRepository});

  Future<LoginEntity> call({
    required String firebaseUID,
    required String email,
    required String firstName,
  }) {
    return loginUserRepository.login(
      firebaseUID: firebaseUID,
      email: email,
      firstName: firstName,
    );
  }
}
