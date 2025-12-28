import 'package:meditation_app/core/utils/logger_utils.dart';
import 'package:meditation_app/features/auth/data/datasource/get_user_local_data_source.dart';
import 'package:meditation_app/features/auth/data/datasource/get_user_remote_data_source.dart';
import 'package:meditation_app/features/auth/domain/entities/user_entity.dart';
import 'package:meditation_app/features/auth/domain/repository/get_user_repository.dart';

class GetUserRepositoryImpl implements GetUserRepository {
  final GetUserRemoteDataSource getUserRemoteDataSource;
  final GetUserLocalDataSource getUserLocalDataSource;

  GetUserRepositoryImpl({
    required this.getUserRemoteDataSource,
    required this.getUserLocalDataSource,
  });

  @override
  Future<UserEntity> getUserByIdAuth({required String userId}) async {
    // 1️⃣ Try local first
    final localUser = await getUserLocalDataSource.getUser();

    if (localUser != null) {
      LoggerUtils.logInfo("User fetched from local Hive storage: $localUser");
      return localUser; // ✅ return cached user
    }

    LoggerUtils.logInfo("No user in local storage, fetching from remote...");

    // 2️⃣ Fetch from remote
    final remoteUser = await getUserRemoteDataSource.getUserBYIdAuth(
      id: userId,
    );

    // 3️⃣ Save to local
    await getUserLocalDataSource.saveUser(remoteUser);
    LoggerUtils.logInfo("User saved to local Hive storage: $remoteUser");

    // 4️⃣ Return user
    return remoteUser;
  }
}
