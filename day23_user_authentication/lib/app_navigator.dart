import 'package:day21_login_ui_bloc/auth/auth_cubit.dart';
import 'package:day21_login_ui_bloc/auth/auth_navigator.dart';
import 'package:day21_login_ui_bloc/loading_view.dart';
import 'package:day21_login_ui_bloc/session_cubit.dart';
import 'package:day21_login_ui_bloc/session_state.dart';
import 'package:day21_login_ui_bloc/session_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(builder: (context, state) {
      return Navigator(
        pages: [
          // Show loading screen
          if (state is UnknownSessionState) const MaterialPage(child: LoadingView()),

          // Show auth flow
          if (state is Unauthenticated)
            MaterialPage(
              child: BlocProvider(
                create: (context) =>
                    AuthCubit(sessionCubit: context.read<SessionCubit>()),
                child: const AuthNavigator(),
              ),
            ),

          // Show session flow
          if (state is Authenticated)  MaterialPage(child: SessionView(username: state.user.username,))
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}