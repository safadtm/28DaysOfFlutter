// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:day21_login_ui_bloc/auth/auth_cubit.dart';
import 'package:day21_login_ui_bloc/auth/auth_repository.dart';
import 'package:day21_login_ui_bloc/auth/form_submission_status.dart';
import 'package:day21_login_ui_bloc/auth/login/login_event.dart';
import 'package:day21_login_ui_bloc/auth/sign_up/signup_event.dart';
import 'package:day21_login_ui_bloc/auth/sign_up/signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepository;
    final AuthCubit authCubit;

  SignUpBloc({
    required this.authRepository,
    required this.authCubit,
  }) : super(SignUpState()) {
    on<SignUpEvent>(_onEvent);
  }
  Future<void> _onEvent(SignUpEvent event, Emitter<SignUpState> emit) async {
    // Username updated
    if (event is SignUpUsernameChanged) {
      emit(state.copyWith(username: event.username));
    }
    // Email updated
    else if (event is SignUpEmailChanged) {
      emit(state.copyWith(email: event.email));
    }
    // Password updated
    else if (event is SignUpPasswordChanged) {
      emit(state.copyWith(password: event.password));
    }
    //form submitted
    else if (event is LoginSubmitted) {
      emit(state.copyWith(formStatus: FormSubmitting()));
      try {
        await authRepository.signUp(
          username: state.username,
          email: state.email,
          password: state.password,
        );
        emit(state.copyWith(formStatus: SubmissionSuccess()));
      } on Exception catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(exception: e)));
      }
    }
  }
}
