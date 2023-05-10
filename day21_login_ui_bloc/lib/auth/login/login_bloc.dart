import 'package:day21_login_ui_bloc/auth/auth_repository.dart';
import 'package:day21_login_ui_bloc/auth/form_submission_status.dart';
import 'package:day21_login_ui_bloc/auth/login/login_event.dart';
import 'package:day21_login_ui_bloc/auth/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  LoginBloc({required this.authRepository}) : super(LoginState()) {
    on<LoginEvent>(_onEvent);
  }
  Future<void> _onEvent(LoginEvent event, Emitter<LoginState> emit) async {
    // Username updated
    if (event is LoginUsernameChanged) {
      emit(state.copyWith(username: event.username));

    }
    // Password updated
    else if (event is LoginPasswordChanged) {
      emit(state.copyWith(password: event.password));
  }
    //form submitted
    else if (event is LoginSubmitted) {
      emit(state.copyWith(formStatus: FormSubmitting()));
      try {
        await authRepository.login();
      } on Exception catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(exception: e)));
      }
    }
  }
}
