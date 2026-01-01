import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meditation_app/core/utils/logger_utils.dart';
import 'package:meditation_app/features/intro/domain/entities/user_entity.dart';
import 'package:meditation_app/features/intro/domain/usecase/get_user_use_case.dart';

part 'get_user_auth_details_event.dart';

part 'get_user_auth_details_state.dart';

class GetUserAuthDetailsBloc
    extends Bloc<GetUserAuthDetailsEvent, GetUserAuthDetailsState> {
  final GetUserUseCase getUserUseCase;

  GetUserAuthDetailsBloc({required this.getUserUseCase})
    : super(GetUserAuthDetailsInitial()) {
    // ==================== Get User Auth Details Event ====================
    on<GetUserByIdAuthEvent>((event, emit) async {
      emit(GetUserAuthDetailsLoading());

      try {
        final user = await getUserUseCase.call(userId: event.userId);

        emit(GetUserAuthDetailsSuccess(userEntity: user));
      } catch (e) {
        emit(
          GetUserAuthDetailsFailure(
            message: e.toString().replaceFirst("Exception: ", ''),
          ),
        );
        LoggerUtils.logError(
          "The Get User By Auth Id Failure: ${e.toString()}",
        );
      }
    });
  }
}
