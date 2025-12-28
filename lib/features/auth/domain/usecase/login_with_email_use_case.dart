import 'package:meditation_app/features/auth/domain/entities/email_auth_login_entity.dart';
import 'package:meditation_app/features/auth/domain/repository/email_auth_repository.dart';

class LoginWithEmailUseCase {
  final EmailAuthRepository emailAuthRepository;

  LoginWithEmailUseCase({required this.emailAuthRepository});

  Future<EmailAuthLoginEntity> call({
    required String email,
    required String password,
  }) {
    return emailAuthRepository.loginWithEmail(
      email: email,
      password: password,
    );
  }
}
