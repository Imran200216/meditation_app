import 'package:meditation_app/features/auth/domain/entities/email_auth_entity.dart';
import 'package:meditation_app/features/auth/domain/repository/email_auth_repository.dart';

class RegisterWithEmailUseCase {
  final EmailAuthRepository emailAuthRepository;

  RegisterWithEmailUseCase({required this.emailAuthRepository});

  Future<EmailAuthEntity> call({
    required String firstName,
    required String lastName,
    required String password,
    required String email,
    required String confirmPassword,
    required String phoneNumber,
    required String profileImage,
  }) {
    return emailAuthRepository.registerWithEmail(
      firstName: firstName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      phoneNumber: phoneNumber,
      profileImage: profileImage,
      lastName: lastName,
    );
  }
}
