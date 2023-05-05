import 'package:day15_bloc_navigation/app_navigator.dart';
import 'package:day15_bloc_navigation/nav_cubit.dart';
import 'package:day15_bloc_navigation/post_cubit.dart';
import 'package:day15_bloc_navigation/post_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => NavCubit(),
          ),
          BlocProvider(
            create: (context) => PostsBloc()..add(LoadPostsEvent()),
          ),
        ],
        child:const AppNavigator(),
      ),
    );
  }
}
