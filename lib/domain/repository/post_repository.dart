import 'dart:io';

import '../../data/models/post.dart';
import '../../data/models/user.dart';

abstract class PostRepository {
  Future<List<Post>> getAllPosts({User? user});

  Future<Post> addPost({required String description, File? image, required User user});

  Future<void> deletePost(int id);
}
