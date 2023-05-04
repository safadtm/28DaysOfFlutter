
import 'package:day14_from_cubit_to_bloc/post_cubit.dart';
import 'package:day14_from_cubit_to_bloc/post_view.dart';
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
      home: BlocProvider<PostsCubit>(
        create: (context) => PostsCubit()..getPosts(),
        child: const PostView(),
      ),
    );
  }
}
