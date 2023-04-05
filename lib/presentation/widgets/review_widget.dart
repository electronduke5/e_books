import 'package:e_books/data/models/review.dart';
import 'package:e_books/presentation/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/author.dart';
import '../../data/models/book.dart';
import '../cubits/review/review_cubit.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.review,
    this.isUserReview = false,
  });

  final Review review;
  final bool isUserReview;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    minRadius: 2,
                    maxRadius: 20,
                    child: Text(
                      review.author.getInitials(),
                      style:
                          const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.author.getFullName(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(review.getDate(),
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                  () {
                    if (isUserReview) {
                      return Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () async {
                            await context.read<ReviewCubit>().deleteReview(review).then(
                                  (value) => SnackBarInfo.show(
                                      message: 'Отзыв удален',
                                      context: context,
                                      isSuccess: true),
                                );
                          },
                          icon: const Icon(
                            Icons.delete_outlined,
                            color: Colors.red,
                          ),
                        ),
                      );
                    }
                    return SizedBox();
                  }(),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                review.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 10),
              bookInfoReview(context, review.book),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.star_outline),
                  Text('${review.rating}/10'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bookInfoReview(BuildContext context, Book book) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Книга: ', style: Theme.of(context).textTheme.bodySmall),
            Text(
              book.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        () {
          if (book.authors?.isEmpty ?? true) {
            return const SizedBox();
          }
          return Row(
            children: [
              Text('Автор: ', style: Theme.of(context).textTheme.bodySmall),
              () {
                if (book.authors == []) {
                  return const Text('Авторов нет');
                }
                for (Author author in book.authors!) {
                  return Text(author.getInitials(),
                      style: Theme.of(context).textTheme.bodySmall);
                }
                return const SizedBox();
              }(),
            ],
          );
        }(),
      ],
    );
  }
}
