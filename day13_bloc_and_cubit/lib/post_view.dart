import 'package:day13_bloc_and_cubit/post_cubit.dart';
import 'package:day13_bloc_and_cubit/posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post"),
      ),
      body: BlocBuilder<PostsCubit, List<Posts>>(
        builder: (context, posts) {
          if (posts.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(posts[index].title),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
