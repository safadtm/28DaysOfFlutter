import 'package:day15_bloc_navigation/posts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavCubit extends Cubit<Posts?> {
  NavCubit() : super(null);
 void showPostDetails(Posts posts) => emit(posts);
 void  popToPosts() => emit(null);

}
