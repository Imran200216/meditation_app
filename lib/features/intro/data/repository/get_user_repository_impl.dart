import 'package:meditation_app/core/utils/logger_utils.dart';
import 'package:meditation_app/features/intro/data/data_source/local/get_user_local_data_source.dart';
import 'package:meditation_app/features/intro/data/data_source/remote/get_user_remote_data_source.dart';
import 'package:meditation_app/features/intro/domain/entities/user_entity.dart';
import 'package:meditation_app/features/intro/domain/repository/get_user_repository.dart';

class GetUserRepositoryImpl implements GetUserRepository {
  final GetUserRemoteDataSource getUserRemoteDataSource;
  final GetUserLocalDataSource getUserLocalDataSource;

  GetUserRepositoryImpl({
    required this.getUserRemoteDataSource,
    required this.getUserLocalDataSource,
  });

  @override
  Future<UserEntity> getUserByIdAuth({required String userId}) async {
    try {
      // 1️⃣ Try local first
      final localUser = await getUserLocalDataSource.getUser();

      if (localUser != null) {
        LoggerUtils.logInfo("✅ User loaded from cache"); // Simplified log
        return localUser;
      }

      LoggerUtils.logInfo("📡 Fetching user from remote...");

      // 2️⃣ Fetch from remote
      final remoteUser = await getUserRemoteDataSource.getUserBYIdAuth(
        id: userId,
      );

      // 3️⃣ Save to local
      await getUserLocalDataSource.saveUser(remoteUser);
      LoggerUtils.logInfo("💾 User saved to cache");

      return remoteUser;
    } catch (e) {
      LoggerUtils.logError("❌ Failed to get user: $e");
      rethrow;
    }
  }
}
