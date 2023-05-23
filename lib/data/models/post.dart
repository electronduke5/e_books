import 'package:e_books/data/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../domain/models/post/post.freezed.dart';

part '../../domain/models/post/post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required int id,
    required String description,
    String? image,
    User? user,
    DateTime? dateCreated,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
