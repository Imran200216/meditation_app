import 'package:meditation_app/features/auth/domain/entities/email_auth_entity.dart';

abstract class EmailAuthRepository {
  Future<EmailAuthEntity> registerWithEmail({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
    required String profileImage,
  });
}
