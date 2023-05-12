import 'package:day18_todo_app/auth_repository.dart';
import 'package:day18_todo_app/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final authRepo = AuthRepository();
  AuthCubit() : super(UnknownState());
  //sign in
  void signIn() async {
    try {
      final userId = await authRepo.webSignIn();
      if (userId.isNotEmpty) {
        emit(AuthenticatedState(userId: userId));
      } else {
        emit(UnauthenticatedState());
      }
    } on Exception {
      emit(UnauthenticatedState());
    }
  }

  //sign out
  void signOut() async {
    try {
      await authRepo.signOut();
      emit(UnauthenticatedState());
    } on Exception {
      emit(UnauthenticatedState());
    }
  }

  //attempt auto sign in
  void attemptAutoSignIn() async {
    try {
      final userId = await authRepo.attemptAutoSignIn();
      if (userId.isNotEmpty) {
        emit(AuthenticatedState(userId: userId));
      } else {
        emit(UnauthenticatedState());
      }
    } on Exception {
      emit(UnauthenticatedState());
    }
  }
}
