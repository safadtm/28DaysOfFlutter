import 'package:day14_from_cubit_to_bloc/post_cubit.dart';
import 'package:day14_from_cubit_to_bloc/posts.dart';
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
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is LoadingPostsState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedPostsState) {
            return RefreshIndicator(
              onRefresh: () async => BlocProvider.of<PostsBloc>(context).add(
                PullToRefreshEvent(),
              ),
              child: ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(state.posts[index].title),
                    ),
                  );
                },
              ),
            );
          } else if (state is FailedToLoadState) {
            return Center(
              child: Text("Error occured : ${state.error}"),
            );
          }
          return Container();
        },
      ),
    );
  }
}
