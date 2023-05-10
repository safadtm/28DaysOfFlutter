class AuthRepository {
  Future<void> login() async {
    print("attemp to login");
    await Future.delayed(const Duration(seconds: 3));
    print("LoggedIn");
    throw Exception("Failed Log in");
  }
}
