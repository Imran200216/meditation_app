import 'package:meditation_app/features/intro/domain/entities/user_entity.dart';

abstract class GetUserRepository {
  Future<UserEntity> getUserByIdAuth({required String userId});
}
