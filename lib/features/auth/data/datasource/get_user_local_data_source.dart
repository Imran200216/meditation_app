import 'package:meditation_app/core/constants/app_db_constants.dart';
import 'package:meditation_app/core/service/hive_service.dart';
import 'package:meditation_app/features/auth/data/models/user_model.dart';

class GetUserLocalDataSource {
  static const String _boxName = AppDbConstants.userBox;
  static const String _userKey = AppDbConstants.userKey;

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
    final data = await HiveService.getData(boxName: _boxName, key: _userKey);

    if (data == null) return null; // <-- handle null safely

    return UserModel.fromJson(Map<String, dynamic>.from(data));
  }

  /// Clear user (logout)
  Future<void> clearUser() async {
    await HiveService.deleteData(boxName: _boxName, key: _userKey);
  }
}
