import 'package:amplify_flutter/amplify_flutter.dart';

class AuthRepository {
  Future<String?> _getUserIdFromAttributes() async {
    try {
      final session = await Amplify.Auth.fetchAuthSession();
      if (!session.isSignedIn) {
        return null;
      }
      final attributes = await Amplify.Auth.fetchUserAttributes();
      print(attributes);
      if (attributes.isEmpty) {
        return null;
      }
      final userId = attributes
          .firstWhere(
            (element) => element.userAttributeKey == "sub",
            // orElse: () => "",
          )
          .value;
      print(userId);
      return userId;
    } on Exception catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<String?> attemptAutoLogin() async {
    try {
      final session = await Amplify.Auth.fetchAuthSession();
      return session.isSignedIn ? (await _getUserIdFromAttributes()) : null;
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> login({
    required String username,
    required String password,
  }) async {
    try {
      final result = await Amplify.Auth.signIn(
        username: username.trim(),
        password: password.trim(),
      );

      return result.isSignedIn ? (await _getUserIdFromAttributes()) : null;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    final options = SignUpOptions(
        userAttributes: {AuthUserAttributeKey.email: email.trim()});
    try {
      final result = await Amplify.Auth.signUp(
        username: username.trim(),
        password: password.trim(),
        options: options,
      );
      return result.isSignUpComplete;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> confirmSignUp({
    required String username,
    required String confirmationCode,
  }) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
        username: username.trim(),
        confirmationCode: confirmationCode,
      );

      return result.isSignUpComplete;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await Amplify.Auth.signOut();
  }
}
