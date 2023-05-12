// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:day21_login_ui_bloc/auth/auth_credentials.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:day21_login_ui_bloc/auth/auth_cubit.dart';
import 'package:day21_login_ui_bloc/auth/auth_repository.dart';
import 'package:day21_login_ui_bloc/auth/form_submission_status.dart';
import 'package:day21_login_ui_bloc/auth/login/login_event.dart';
import 'package:day21_login_ui_bloc/auth/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  final AuthCubit authCubit;
  LoginBloc({
    required this.authRepository,
    required this.authCubit,
  }) : super(LoginState()) {
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
        final userId = await authRepository.login(
          username: state.username,
          password: state.password,
        );
        emit(state.copyWith(formStatus: SubmissionSuccess()));
        authCubit.launchSession(
          AuthCredentials(
            username: state.username,
            userId: userId,
          ),
        );
      } on Exception catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(exception: e)));
      }
    }
  }
}
