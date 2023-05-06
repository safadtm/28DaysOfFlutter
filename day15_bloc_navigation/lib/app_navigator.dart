import 'package:day15_bloc_navigation/nav_cubit.dart';
import 'package:day15_bloc_navigation/post_details_view.dart';
import 'package:day15_bloc_navigation/post_view.dart';
import 'package:day15_bloc_navigation/posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, Posts?>(
      builder: (context, post) {
        return Navigator(
          pages: [
            const MaterialPage(child: PostView()),
            if (post != null)
              MaterialPage(
                child: PostDetailsView(post: post),
              ),
          ],
          onPopPage: (route, result) {
            BlocProvider.of<NavCubit>(context).popToPosts();
            return route.didPop(result);
          },
        );
      },
    );
  }
}
