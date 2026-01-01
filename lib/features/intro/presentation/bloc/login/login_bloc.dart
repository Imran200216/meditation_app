import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meditation_app/core/utils/logger_utils.dart';
import 'package:meditation_app/features/intro/domain/entities/login_entity.dart';
import 'package:meditation_app/features/intro/domain/usecase/login_use_case.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginInitial()) {
    //
    on<LoginAuthEvent>((event, emit) async {
      emit(LoginLoading());

      try {
        final model = await loginUseCase.call(
          firebaseUID: event.firebaseUID,
          email: event.email,
          firstName: event.firstName,
        );

        emit(LoginSuccess(loginEntity: model));
      } catch (e) {
        emit(LoginFailure(message: e.toString()));

        LoggerUtils.logError(
          "⛔ Error executing GraphQL query: ${e.toString()}",
        );
      }
    });
  }
}
