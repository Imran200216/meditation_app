part of 'get_user_auth_details_bloc.dart';

sealed class GetUserAuthDetailsEvent extends Equatable {
  const GetUserAuthDetailsEvent();
}

// =================  GET USER BY ID AUTH EVENT ====================
final class GetUserByIdAuthEvent extends GetUserAuthDetailsEvent {
  final String userId;

  const GetUserByIdAuthEvent({required this.userId});

  @override
  // TODO: implement props
  List<Object?> get props => [userId];
}
