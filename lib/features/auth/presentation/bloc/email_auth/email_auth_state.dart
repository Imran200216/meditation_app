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
  final EmailAuthEntity emailAuthEntity;

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
