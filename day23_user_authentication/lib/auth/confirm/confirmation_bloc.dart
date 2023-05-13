// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:day21_login_ui_bloc/auth/auth_cubit.dart';
import 'package:day21_login_ui_bloc/auth/auth_repository.dart';
import 'package:day21_login_ui_bloc/auth/confirm/confirmation_event.dart';
import 'package:day21_login_ui_bloc/auth/confirm/confirmation_state.dart';
import 'package:day21_login_ui_bloc/auth/form_submission_status.dart';

class ConfirmationBloc extends Bloc<ConfirmationEvent, ConfirmationState> {
  final AuthRepository authRepository;
  final AuthCubit authCubit;

  ConfirmationBloc({
    required this.authRepository,
    required this.authCubit,
  }) : super(ConfirmationState()) {
    on<ConfirmationEvent>(_onEvent);
  }
  Future<void> _onEvent(
      ConfirmationEvent event, Emitter<ConfirmationState> emit) async {
    // Confirmation code updated
    if (event is ConfirmationCodeChanged) {
      emit(state.copyWith(code: event.code));
    }

    //form submitted
    else if (event is ConfirmationSubmitted) {
      emit(state.copyWith(formStatus: FormSubmitting()));
      try {
        await authRepository.confirmSignUp(
          username: authCubit.credentials!.username,
          confirmationCode: state.code,
        );

        emit(state.copyWith(formStatus: SubmissionSuccess()));

        final credentials = authCubit.credentials;
        final userId = await authRepository.login(
          username: credentials!.username,
          password: credentials.password!,
        );
        credentials.userId = userId;

        authCubit.launchSession(credentials);
      } on Exception catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(exception: e)));
      }
    }
  }
}
