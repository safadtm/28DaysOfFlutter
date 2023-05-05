// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:day15_bloc_navigation/posts.dart';

class PostDetailsView extends StatelessWidget {
  final Posts post;
  const PostDetailsView({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Center(
        child: Text(post.body),
      ),
    );
  }
}
