import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meditation_app/core/utils/logger_utils.dart';
import 'package:meditation_app/features/auth/domain/entities/email_auth_login_entity.dart';
import 'package:meditation_app/features/auth/domain/entities/email_auth_register_entity.dart';
import 'package:meditation_app/features/auth/domain/usecase/login_with_email_use_case.dart';
import 'package:meditation_app/features/auth/domain/usecase/register_with_email_usecase.dart';

part 'email_auth_event.dart';

part 'email_auth_state.dart';

class EmailAuthBloc extends Bloc<EmailAuthEvent, EmailAuthState> {
  final RegisterWithEmailUseCase registerWithEmailUseCase;
  final LoginWithEmailUseCase loginWithEmailUseCase;

  EmailAuthBloc({
    required this.registerWithEmailUseCase,
    required this.loginWithEmailUseCase,
  }) : super(EmailAuthInitial()) {
    // Email Register
    on<RegisterWithEmailEvent>((event, emit) async {
      emit(EmailRegisterAuthLoading());

      try {
        final result = await registerWithEmailUseCase.call(
          firstName: event.firstName,
          lastName: event.lastName,
          password: event.password,
          email: event.email,
          confirmPassword: event.confirmPassword,
          phoneNumber: event.phoneNumber,
          profileImage: event.profileImage,
        );

        if (result.success) {
          emit(EmailRegisterAuthSuccess(emailAuthEntity: result));
        } else {
          emit(EmailRegisterAuthFailure(message: result.message));
          LoggerUtils.logError(
            "The Email Auth Failure: ${result.message.toString()}",
          );
        }
      } catch (e) {
        emit(EmailRegisterAuthFailure(message: "Some Thing Went Wrong"));
      }
    });

    // Email Login
    on<LoginWithEmailEvent>((event, emit) async {
      emit(EmailLoginAuthLoading());

      try {
        final result = await loginWithEmailUseCase.call(
          email: event.email,
          password: event.password,
        );

        if (result.token.isNotEmpty) {
          emit(EmailLoginAuthSuccess(emailAuthLoginEntity: result));
          LoggerUtils.logInfo("The Email Login: ${result.token}");
        } else {
          emit(EmailLoginAuthFailure(message: "Login Failure"));
        }
      } catch (e) {
        emit(EmailLoginAuthFailure(message: e.toString()));
        LoggerUtils.logError("The Email Login Catch Failure: ${e.toString()}");
      }
    });
  }
}
