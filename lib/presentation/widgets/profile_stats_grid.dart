import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../data/models/user.dart';

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
          title: 'Закладки',
          value: user.bookmarks?.length,
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
        ),
        profileStatTile(
          title: 'Ревью',
          value: user.reviews?.length,
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
        ),
        profileStatTile(
          title: 'Полки',
          value: user.shelves?.length,
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
        ),

        profileStatTile(
          title: 'Что-то ещё',
          value: 12,
          crossAxisCellCount: 2,
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
  }) {
    return StaggeredGridTile.count(
      crossAxisCellCount: crossAxisCellCount,
      mainAxisCellCount: mainAxisCellCount,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold),),
            Text(value.toString()),
          ],
        ),
      ),
    );
  }
}