// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:day21_login_ui_bloc/models/ModelProvider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:day21_login_ui_bloc/auth/auth_credentials.dart';
import 'package:day21_login_ui_bloc/auth/auth_repository.dart';
import 'package:day21_login_ui_bloc/data_repository.dart';
import 'package:day21_login_ui_bloc/session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  final AuthRepository authRepo;
  final DataRepository dataRepo;
  SessionCubit({
    required this.authRepo,
    required this.dataRepo,
  }) : super(UnknownSessionState()) {
    attemptAutoLogin();
  }

  void attemptAutoLogin() async {
    try {
      final userId = await authRepo.attemptAutoLogin();
      if (userId == null) {
        throw Exception('User not logged in');
      }
      User? user = await dataRepo.getUserByid(userId);
      user ??= await dataRepo.createUser(
        userId: userId,
        username: "User-${UUID()}",
      );
      emit(Authenticated(user: user));
    } on Exception {
      emit(Unauthenticated());
    }
  }

  void showAuth() => emit(Unauthenticated());
  void showSession(AuthCredentials credentials) async {
    try {
      
      User? user = await dataRepo.getUserByid(credentials.userId!);
      user ??= await dataRepo.createUser(
          userId: credentials.userId!,
          username: credentials.username,
          email: credentials.email);

      emit(Authenticated(user: user));
    } on Exception {
      emit(Unauthenticated());
    }
  }

  void signOut() {
    authRepo.signOut();
    emit(Unauthenticated());
  }
}
