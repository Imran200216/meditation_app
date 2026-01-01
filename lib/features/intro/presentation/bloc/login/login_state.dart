part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();
}

final class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

// ======================== LOGIN STATES ========================
final class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

final class LoginSuccess extends LoginState {
  final LoginEntity loginEntity;

  const LoginSuccess({required this.loginEntity});

  @override
  // TODO: implement props
  List<Object?> get props => [loginEntity];
}

final class LoginFailure extends LoginState {
  final String message;

  const LoginFailure({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
