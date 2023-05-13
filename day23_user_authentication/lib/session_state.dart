
import 'package:day21_login_ui_bloc/models/ModelProvider.dart';

abstract class SessionState {}

class UnknownSessionState extends SessionState {}

class Unauthenticated extends SessionState {}

class Authenticated extends SessionState {
  final User user;

  Authenticated({required this.user});
}