import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_books/data/models/user.dart';
import 'package:e_books/data/utils/constants.dart';

import '../../domain/repository/post_repository.dart';
import '../api_service.dart';
import '../models/post.dart';

class PostRepositoryImpl with ApiService<Post> implements PostRepository {
  @override
  String apiRoute = ApiConstUrl.postUrl;

  @override
  Future<Post> addPost({required String description, File? image, required User user}) async  {
    return post(
      fromJson: (Map<String, dynamic> json) => Post.fromJson(json),
      data: {
        'description' : description,
        'image' :  image == null ? null : await MultipartFile.fromFile(image.path),
        'user_id' : user.id,
      },
    );
  }

  @override
  Future<List<Post>> getAllPosts({User? user}) {
    return getAll(
      fromJson: (Map<String, dynamic> json) => Post.fromJson(json),
      params: {
        'user' : user?.id,
      }
    );
  }

  @override
  Future<void> deletePost(int id) {
    return delete(id);
  }

}