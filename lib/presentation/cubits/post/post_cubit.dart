import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/post.dart';
import '../../../data/models/user.dart';
import '../../di/app_module.dart';
import '../models_status.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostState());
  final _repository = AppModule.getPostRepository();

  Future<List<Post>?> loadPosts({User? user}) async {
    emit(state.copyWith(allPostsStatus: LoadingStatus()));
    try {
      final List<Post> posts = await _repository.getAllPosts(user: user);
      emit(state.copyWith(
          allPostsStatus: LoadedStatus<List<Post>>(item: posts)));
      return posts;
    } catch (exception) {
      emit(state.copyWith(
          allPostsStatus: FailedStatus(
              state.allPostsStatus.message ?? exception.toString())));
      return null;
    }
  }

  Future<void> deletePost(int id) async {
    emit(state.copyWith(deletePostStatus: LoadingStatus()));
    try {
      _repository.deletePost(id);
      emit(state.copyWith(deletePostStatus: LoadedStatus()));
    } catch (exception) {
      emit(state.copyWith(
          deletePostStatus: FailedStatus(
              state.allPostsStatus.message ?? exception.toString())));
    }
  }

  Future<Post?> addPost({
    required String description,
    File? image,
    required User user,
  }) async {
    emit(state.copyWith(addPostStatus: LoadingStatus()));
    try {
      final Post post = await _repository.addPost(
        description: description,
        user: user,
        image: image,
      );
      emit(state.copyWith(addPostStatus: LoadedStatus<Post>(item: post)));
      return post;
    } catch (exception) {
      emit(state.copyWith(
          addPostStatus: FailedStatus(
              state.allPostsStatus.message ?? exception.toString())));
      return null;
    }
  }

  Future<void> imageChanged(File image) async {
    emit(state.copyWith(image: image));
  }
}
