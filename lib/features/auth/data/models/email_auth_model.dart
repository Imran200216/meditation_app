import 'package:meditation_app/features/auth/domain/entities/email_auth_entity.dart';

class EmailAuthModel extends EmailAuthEntity {
  EmailAuthModel({required super.message, required super.success});

  factory EmailAuthModel.fromJson(Map<String, dynamic> json) {
    return EmailAuthModel(
      message: json['message'] as String,
      success: json['success'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'success': success};
  }
}
