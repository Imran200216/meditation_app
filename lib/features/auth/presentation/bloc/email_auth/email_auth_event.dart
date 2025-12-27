part of 'email_auth_bloc.dart';

sealed class EmailAuthEvent extends Equatable {
  const EmailAuthEvent();
}

final class RegisterWithEmailEvent extends EmailAuthEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final String phoneNumber;
  final String profileImage;

  const RegisterWithEmailEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phoneNumber,
    required this.profileImage,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    firstName,
    lastName,
    email,
    password,
    confirmPassword,
    phoneNumber,
    profileImage,
  ];
}
