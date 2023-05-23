import 'package:e_books/presentation/widgets/profile_card_widget.dart';
import 'package:flutter/material.dart';

import '../../data/models/user.dart';

class FollowersPageArguments {
  final User user;
  final bool isFollowers;

  FollowersPageArguments({required this.user,required  this.isFollowers});

}

class FollowersPage extends StatelessWidget {
  FollowersPage({Key? key}) : super(key: key);

  bool isFollowers = true;
  User? user;
  List<User> followersList = [];

  @override
  Widget build(BuildContext context) {
    FollowersPageArguments? args = ModalRoute.of(context)?.settings.arguments as FollowersPageArguments?;
    user = args!.user;
    isFollowers = args.isFollowers;
    followersList = isFollowers ? user!.followers! : user!.subscriptions!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${isFollowers ? 'Подписчики' : 'Подписки'} автора ${user?.surname ?? ''} ${user?.name ?? ''}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: followersList.length,
        itemBuilder: (context, index) {
          return ProfileCard(user: followersList[index]);
        },
      ),
    );
  }
}
