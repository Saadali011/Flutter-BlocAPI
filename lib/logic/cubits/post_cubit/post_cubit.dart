import 'package:blocapi/data/repositories/post_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocapi/logic/cubits/post_cubit/post_state.dart';
import '../../../data/models/post_model.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()){
    fetchPost();
  }

  PostRepository postRepository = PostRepository();

  void fetchPost() async {
    try {
      Iterable<PostModel> posts = await postRepository.fetchPosts();
      List<PostModel> postList = posts.toList(); // Convert Iterable to List
      emit(PostLoadedState(postList));
    }
    on DioError catch (ex) {
      if(ex.type == DioErrorType){
        emit(PostErrorState("Can't fetch posts,please check your internet connection!") );
      }
      else{
        emit(PostErrorState(ex.type.toString()));
      }
      // emit(PostErrorState(ex.type.toString()));
    }
  }
}
