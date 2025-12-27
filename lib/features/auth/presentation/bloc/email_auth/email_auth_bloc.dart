import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meditation_app/core/utils/logger_utils.dart';
import 'package:meditation_app/features/auth/domain/entities/email_auth_entity.dart';
import 'package:meditation_app/features/auth/domain/usecase/register_with_email_usecase.dart';

part 'email_auth_event.dart';

part 'email_auth_state.dart';

class EmailAuthBloc extends Bloc<EmailAuthEvent, EmailAuthState> {
  final RegisterWithEmailUseCase registerWithEmailUseCase;

  EmailAuthBloc({required this.registerWithEmailUseCase})
    : super(EmailAuthInitial()) {
    // Register With Email Event
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
  }
}
