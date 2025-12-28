part of 'email_auth_bloc.dart';

sealed class EmailAuthState extends Equatable {
  const EmailAuthState();
}

final class EmailAuthInitial extends EmailAuthState {
  @override
  List<Object> get props => [];
}

final class EmailRegisterAuthLoading extends EmailAuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class EmailRegisterAuthSuccess extends EmailAuthState {
  final EmailAuthRegisterEntity emailAuthEntity;

  const EmailRegisterAuthSuccess({required this.emailAuthEntity});

  @override
  // TODO: implement props
  List<Object?> get props => [emailAuthEntity];
}

final class EmailRegisterAuthFailure extends EmailAuthState {
  final String message;

  const EmailRegisterAuthFailure({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

final class EmailLoginAuthLoading extends EmailAuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class EmailLoginAuthSuccess extends EmailAuthState {
  final EmailAuthLoginEntity emailAuthLoginEntity;

  const EmailLoginAuthSuccess({required this.emailAuthLoginEntity});

  @override
  // TODO: implement props
  List<Object?> get props => [emailAuthLoginEntity];
}

final class EmailLoginAuthFailure extends EmailAuthState {
  final String message;

  EmailLoginAuthFailure({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
