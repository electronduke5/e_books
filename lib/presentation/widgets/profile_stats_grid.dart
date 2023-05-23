import 'package:e_books/presentation/di/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../data/models/user.dart';
import '../pages/followers_page.dart';

class ProfileStatsGrid extends StatelessWidget {
  const ProfileStatsGrid({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 3,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      children: [
        profileStatTile(
          onTap: () {
            if (user.bookmarks?.isNotEmpty ?? false) {
              Navigator.of(context).pushNamed('/bookmarks');
            }
          },
          title: 'Закладки',
          value: user.bookmarks?.length,
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
        ),
        profileStatTile(
          onTap: () {
            if (user.reviews?.isNotEmpty ?? false) {
              Navigator.of(context).pushNamed('/user-reviews', arguments: user.reviews);
            }
          },
          title: 'Ревью',
          value: user.reviews?.length,
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
        ),
        () {
          if (user.id == AppModule.getProfileHolder().user.id) {
            return profileStatTile(
              onTap: () {
                Navigator.of(context).pushNamed('/shelves');
              },
              title: 'Полки',
              value: user.shelves?.length,
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
            );
          } else {
            return const SizedBox();
          }
        }(),
        profileStatTile(
          onTap: () {
            if (user.posts?.isNotEmpty ?? false) {
              Navigator.of(context).pushNamed('/profile-posts', arguments: user);
            }
          },
          title: 'Посты',
          value: user.posts?.length,
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
        ),
        profileStatTile(
          onTap: () {
            if (user.createdBooks?.isNotEmpty ?? false) {
              Navigator.of(context).pushNamed('/profile-books', arguments: user);
            }
          },
          title: 'Книги',
          value: user.createdBooks?.length,
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
        ),
        profileStatTile(
          onTap: () {
            if (user.followers?.isNotEmpty ?? false) {
              Navigator.of(context).pushNamed(
                '/profile-followers',
                arguments: FollowersPageArguments(
                  user: user,
                  isFollowers: true,
                ),
              );
            }
          },
          title: 'Подписчики',
          value: user.followers?.length,
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
        ),
        profileStatTile(
          onTap: () {
            if (user.subscriptions?.isNotEmpty ?? false) {
              Navigator.of(context).pushNamed(
                '/profile-followers',
                arguments: FollowersPageArguments(
                  user: user,
                  isFollowers: false,
                ),
              );
            }
          },
          title: 'Подписки',
          value: user.subscriptions?.length,
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
        ),
      ],
    );
  }

  StaggeredGridTile profileStatTile({
    required String title,
    required var value,
    required int crossAxisCellCount,
    required int mainAxisCellCount,
    required void Function() onTap,
  }) {
    return StaggeredGridTile.count(
      crossAxisCellCount: crossAxisCellCount,
      mainAxisCellCount: mainAxisCellCount,
      child: Card(
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold),),
              Text(value.toString()),
            ],
          ),
        ),
      ),
    );
  }
}