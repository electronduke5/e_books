part of 'post_cubit.dart';

class PostState {
  final ApiStatus<List<Post>> allPostsStatus;
  final ApiStatus<Post> addPostStatus;
  final ApiStatus<void> deletePostStatus;
  final File? image;

  PostState({
    this.image,
    this.addPostStatus = const IdleStatus(),
    this.deletePostStatus = const IdleStatus(),
    this.allPostsStatus = const IdleStatus(),
  });

  PostState copyWith({
    ApiStatus<List<Post>>? allPostsStatus,
    ApiStatus<Post>? addPostStatus,
    ApiStatus<void>? deletePostStatus,
    File? image,
  }) {
    return PostState(
      deletePostStatus: deletePostStatus ?? this.deletePostStatus,
      addPostStatus: addPostStatus ?? this.addPostStatus,
      allPostsStatus: allPostsStatus ?? this.allPostsStatus,
      image: image ?? this.image,
    );
  }
}
