part of 'get_user_auth_details_bloc.dart';

sealed class GetUserAuthDetailsState extends Equatable {
  const GetUserAuthDetailsState();
}

final class GetUserAuthDetailsInitial extends GetUserAuthDetailsState {
  @override
  List<Object> get props => [];
}

final class GetUserAuthDetailsLoading extends GetUserAuthDetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class GetUserAuthDetailsSuccess extends GetUserAuthDetailsState {
  final UserEntity userEntity;

  const GetUserAuthDetailsSuccess({required this.userEntity});

  @override
  // TODO: implement props
  List<Object?> get props => [userEntity];
}

final class GetUserAuthDetailsFailure extends GetUserAuthDetailsState {
  final String message;

  const GetUserAuthDetailsFailure({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
