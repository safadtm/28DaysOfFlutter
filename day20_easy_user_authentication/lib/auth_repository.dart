import 'package:amplify_flutter/amplify_flutter.dart';

Future<String> fetchUserIfFromAttributes() async {
  try {
    final attributes = await Amplify.Auth.fetchUserAttributes();
    final subAttributes = attributes
        .firstWhere((element) => element.userAttributeKey.toString() == "sub");
    final userId = subAttributes.value;
    return userId;
  } catch (e) {
    rethrow;
  }
}

class AuthRepository {
  //sign in
  Future<String> webSignIn() async {
    try {
      final result = await Amplify.Auth.signInWithWebUI();
      if (result.isSignedIn) {
        //get userId
        return await fetchUserIfFromAttributes();
      } else {
        throw Exception("Could not sign in");
      }
    } catch (e) {
      rethrow;
    }
  }

  //sign out
  Future<void> signOut() async {
    try {
      await Amplify.Auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  //Auto sign in
  Future<String> attemptAutoSignIn() async {
    try {
      final session = await Amplify.Auth.fetchAuthSession();
      if (session.isSignedIn) {
        return await fetchUserIfFromAttributes();
      } else {
        throw Exception("Not signed in");
      }
    } catch (e) {
      rethrow;
    }
  }
}
