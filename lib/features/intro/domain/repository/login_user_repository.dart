import 'package:meditation_app/features/intro/domain/entities/login_entity.dart';

abstract class LoginUserRepository {
  Future<LoginEntity> login({
    required String firebaseUID,
    required String email,
    required String firstName,
  });
}
