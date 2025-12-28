import 'package:meditation_app/features/auth/domain/entities/email_auth_register_entity.dart';

class EmailAuthRegisterModel extends EmailAuthRegisterEntity {
  EmailAuthRegisterModel({required super.message, required super.success});

  factory EmailAuthRegisterModel.fromJson(Map<String, dynamic> json) {
    return EmailAuthRegisterModel(
      message: json['message'] as String,
      success: json['success'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'success': success};
  }
}
