// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:day21_login_ui_bloc/session_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:day21_login_ui_bloc/auth/auth_credentials.dart';

enum AuthState { login, signUp, confirmSignUp }

class AuthCubit extends Cubit<AuthState> {
  final SessionCubit sessionCubit;
  AuthCredentials? credentials;

  AuthCubit({
    required this.sessionCubit,
  }) : super(AuthState.login);


  void showLogin() => emit(AuthState.login);
  void showSignUp() => emit(AuthState.signUp);
  void showConfirmSignUp({
    required String username,
    required String email,
    required String password,
  }) {
    credentials = AuthCredentials(
      username: username,
      email: email,
      password: password,
    );
    emit(AuthState.confirmSignUp);
  }

  void launchSession(AuthCredentials credentials) =>
      sessionCubit.showSession(credentials);
}
