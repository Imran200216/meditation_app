import 'package:meditation_app/features/auth/data/datasource/email_auth_data_source.dart';
import 'package:meditation_app/features/auth/domain/entities/email_auth_login_entity.dart';
import 'package:meditation_app/features/auth/domain/entities/email_auth_register_entity.dart';
import 'package:meditation_app/features/auth/domain/repository/email_auth_repository.dart';

class EmailAuthRepositoryImpl implements EmailAuthRepository {
  final EmailAuthDataSource emailAuthDataSource;

  EmailAuthRepositoryImpl({required this.emailAuthDataSource});

  @override
  Future<EmailAuthRegisterEntity> registerWithEmail({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
    required String profileImage,
  }) {
    final model = emailAuthDataSource.registerWithEmail(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      phoneNumber: phoneNumber,
      profileImage: profileImage,
    );

    return model;
  }

  @override
  Future<EmailAuthLoginEntity> loginWithEmail({
    required String email,
    required String password,
  }) {
    final model = emailAuthDataSource.loginWithEmail(
      email: email,
      password: password,
    );

    return model;
  }
}
