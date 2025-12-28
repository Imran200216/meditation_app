import 'package:meditation_app/features/auth/domain/entities/user_entity.dart';
import 'package:meditation_app/features/auth/domain/repository/get_user_repository.dart';

class GetUserUseCase {
  final GetUserRepository getUserRepository;

  GetUserUseCase({required this.getUserRepository});

  Future<UserEntity> call({required String userId}) {
    return getUserRepository.getUserByIdAuth(userId: userId);
  }
}
