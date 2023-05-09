abstract class AuthState {}

class UnknownState extends AuthState {}

class AuthenticatedState extends AuthState {
  final String userId;

  AuthenticatedState({required this.userId});
}

class UnauthenticatedState extends AuthState{}
