import 'package:meditation_app/features/auth/domain/entities/email_auth_login_entity.dart';

class EmailAuthLoginModel extends EmailAuthLoginEntity {
   EmailAuthLoginModel({required super.token, required super.user});

  /// FROM JSON
  factory EmailAuthLoginModel.fromJson(Map<String, dynamic> json) {
    return EmailAuthLoginModel(
      token: json['token'] as String,
      user: json['user'] as String,
    );
  }

  /// TO JSON
  Map<String, dynamic> toJson() {
    return {'token': token, 'user': user};
  }
}
