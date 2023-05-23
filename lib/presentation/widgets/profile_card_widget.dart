import 'package:flutter/material.dart';

import '../../data/models/user.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key, required this.user}) : super(key: key);

  final User user;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  minRadius: 2,
                  maxRadius: 20,
                  child: Text(
                    user.getInitials(),
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 16),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        '${user.surname} ${user.name}',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Text(
                      user.username,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
