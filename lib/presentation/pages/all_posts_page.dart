import 'package:e_books/presentation/cubits/post/post_cubit.dart';
import 'package:e_books/presentation/widgets/post_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/post.dart';
import '../cubits/models_status.dart';

class AllPostsPage extends StatelessWidget {
  AllPostsPage({Key? key}) : super(key: key);

  Post? post;
  List<Post> allPosts = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AppBar(
            title: const Text(
              'Лента',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: buildPostList(context),
          ),
        ],
      ),
    );
  }

  Widget buildPostList(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<PostCubit>().loadPosts().then((value) {
          print(value);
          allPosts = value ?? allPosts;
          print('allPosts: $allPosts');
        });
      },
      child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          print('postStatus: ${state.allPostsStatus.runtimeType}');
          switch (state.allPostsStatus.runtimeType) {
            case LoadingStatus<List<Post>>:
              return const Center(child: CircularProgressIndicator());
            case LoadedStatus<List<Post>>:
              print('item in postStatus: ${state.allPostsStatus.item}');
              if (state.allPostsStatus.item == null) {
                return const Center(child: CircularProgressIndicator());
              }
              allPosts.isEmpty ? allPosts = state.allPostsStatus.item! : () {};
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: allPosts.length,
                      itemBuilder: (context, index) {
                        return PostCard(post: allPosts[index]);
                      },
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              );
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
