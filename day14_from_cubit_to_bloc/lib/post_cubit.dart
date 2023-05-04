
import 'package:day14_from_cubit_to_bloc/data_service.dart';
import 'package:day14_from_cubit_to_bloc/posts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsCubit extends Cubit<List<Posts>> {
  final _dataService = DataService();
  PostsCubit() : super([]);
  void getPosts() async {
    emit(await _dataService.getPosts());
  }
}
