import 'package:meditation_app/features/auth/domain/entities/email_auth_login_entity.dart';
import 'package:meditation_app/features/auth/domain/entities/email_auth_register_entity.dart';

abstract class EmailAuthRepository {
  Future<EmailAuthRegisterEntity> registerWithEmail({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
    required String profileImage,
  });

  Future<EmailAuthLoginEntity> loginWithEmail({
    required String email,
    required String password,
  });
}
