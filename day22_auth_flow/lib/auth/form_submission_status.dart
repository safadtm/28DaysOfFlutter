abstract class FormSubmissionStatus {
  FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus {
  InitialFormStatus();
}

class FormSubmitting extends FormSubmissionStatus {}

class SubmissionSuccess extends FormSubmissionStatus {}

class SubmissionFailed extends FormSubmissionStatus {
  final Exception exception;

  SubmissionFailed({required this.exception});
}
