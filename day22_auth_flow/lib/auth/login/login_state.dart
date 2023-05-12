// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:day21_login_ui_bloc/auth/form_submission_status.dart';

class LoginState {
  final String username;
  bool get isValidUsername => username.length > 6;

  final String password;
  bool get isValidPassword => password.length > 6;

  final FormSubmissionStatus? formStatus;

  LoginState({
    this.username = "",
    this.password = "",
     this.formStatus,
  });

  LoginState copyWith({
    String? username,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
