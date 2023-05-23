import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:day21_login_ui_bloc/models/ModelProvider.dart';

class DataRepository {
  Future<User?> getUserByid(String userid) async {
    try {
      final users = await Amplify.DataStore.query(User.classType,
          where: User.ID.eq(userid));
      return users.isNotEmpty ? users.first : null;
    } catch (e) {
      rethrow;
    }
  }

  Future<User> createUser(
      {required String userId,
      required String username,
        String? email}) async {
    final newUser = User(
      id: userId,
      username: username,
      email: email,
    );
    try {
      await Amplify.DataStore.save(newUser);
      return newUser;
    } catch (e) {
      rethrow;
    }
  }
}
