import 'package:day15_bloc_navigation/data_service.dart';
import 'package:day15_bloc_navigation/posts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsCubit extends Cubit<List<Posts>> {
  final _dataService = DataService();
  PostsCubit() : super([]);
  void getPosts() async {
    emit(await _dataService.getPosts());
  }
}

abstract class PostsEvent {}

class LoadPostsEvent extends PostsEvent {}

class PullToRefreshEvent extends PostsEvent {}

abstract class PostsState {}

class LoadingPostsState extends PostsState {}

class LoadedPostsState extends PostsState {
  List<Posts> posts;
  LoadedPostsState({required this.posts});
}

class FailedToLoadState extends PostsState {
  Error error;
  FailedToLoadState({required this.error});
}

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final _dataService = DataService();
  PostsBloc() : super(LoadingPostsState()) {
    on((event, emit) async {
      final data = await _dataService.getPosts();

      try {
        if (event is LoadPostsEvent || event is PullToRefreshEvent) {
          emit(LoadedPostsState(posts: data));
        }
      } on Error catch (e) {
        emit(FailedToLoadState(error: e));
      }
    });
  }
}
