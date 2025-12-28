import 'package:meditation_app/core/service/hive_service.dart';
import 'package:meditation_app/features/auth/data/models/user_model.dart';

class GetUserLocalDataSource {
  static const String _boxName = 'user_box';
  static const String _userKey = 'current_user';

  /// Save user locally
  Future<void> saveUser(UserModel user) async {
    await HiveService.saveData(
      boxName: _boxName,
      key: _userKey,
      value: user.toJson(),
    );
  }

  /// Get user from local storage
  Future<UserModel?> getUser() async {
    final data = HiveService.getData(boxName: _boxName, key: _userKey);

    return UserModel.fromJson(Map<String, dynamic>.from(await data));
  }

  /// Clear user (logout)
  Future<void> clearUser() async {
    await HiveService.deleteData(boxName: _boxName, key: _userKey);
  }
}
