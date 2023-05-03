import 'package:day13_bloc_and_cubit/data_service.dart';
import 'package:day13_bloc_and_cubit/posts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsCubit extends Cubit<List<Posts>> {
  final _dataService = DataService();
  PostsCubit() : super([]);
  void getPosts() async {
    emit(await _dataService.getPosts());
  }
}
