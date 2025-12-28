import 'package:meditation_app/features/auth/domain/entities/user_entity.dart';

abstract class GetUserRepository {
  Future<UserEntity> getUserByIdAuth({required String userId});
}
