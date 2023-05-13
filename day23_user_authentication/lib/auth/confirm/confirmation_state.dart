
import 'package:day21_login_ui_bloc/auth/form_submission_status.dart';

class ConfirmationState {
  final String code;
  bool get isValidCode => code.length == 6;

  final FormSubmissionStatus? formStatus;

  ConfirmationState({
    this.code = '',
    this.formStatus ,
  });

  ConfirmationState copyWith({
     String? code,
     FormSubmissionStatus? formStatus,
  }) {
    return ConfirmationState(
      code: code??this.code,
      formStatus: formStatus,
    );
  }
}