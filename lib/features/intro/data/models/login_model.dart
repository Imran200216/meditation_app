import 'package:meditation_app/features/intro/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({required super.user, required super.token});

  /// From JSON
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      user: json['user'] as String,
      token: json['token'] as String,
    );
  }

  /// To JSON
  Map<String, dynamic> toJson() {
    return {'user': user, 'token': token};
  }
}
