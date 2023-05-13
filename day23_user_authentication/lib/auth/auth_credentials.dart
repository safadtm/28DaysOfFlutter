class AuthCredentials {
  String username;
  String? email;
  String? password;
  String? userId;

  AuthCredentials({
    required this.username,
    this.email,
    this.password,
    this.userId,
  });
}
