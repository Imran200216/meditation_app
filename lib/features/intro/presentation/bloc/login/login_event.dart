part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

final class LoginAuthEvent extends LoginEvent {
  final String firebaseUID;
  final String email;
  final String firstName;

  const LoginAuthEvent({
    required this.firebaseUID,
    required this.email,
    required this.firstName,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [firebaseUID, email, firstName];
}
