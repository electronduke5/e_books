import 'dart:math';

import 'package:flutter/material.dart';

import '../../data/models/author.dart';
import '../../data/models/book.dart';

class BookWidget extends StatelessWidget {
  const BookWidget({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
      child: InkWell(
        onTap: () async {
          //context.read<ReviewCubit>().loadReviews(filter: 'book', value: book.id).then((value) {
          Navigator.of(context).pushNamed('/book-info', arguments: book);

          //});
        },
        child: Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                () {
                  if (book.image == null) {
                    return Align(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.primaries[Random()
                                        .nextInt(Colors.primaries.length)],
                                    Colors.primaries[Random()
                                        .nextInt(Colors.primaries.length)],
                                  ],
                                )),
                            height: 230,
                            width: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  book.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                () {
                                  if (book.authors == []) {
                                    return Text('Авторов нет');
                                  }
                                  for (Author author in book.authors!) {
                                    return Text(author.getFullName(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(fontSize: 16));
                                  }
                                  return Text('');
                                }(),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }
                  return Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                        child: Image.network(book.image!)),
                  );
                }(),
                Wrap(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                            () {
                          if (book.authors == []) {
                            return Text('Авторов нет');
                          }
                          for (Author author in book.authors!) {
                            return Text(author.getInitials(),
                                style: Theme.of(context).textTheme.bodySmall);
                          }
                          return const SizedBox();
                        }(),
                        // Text(book.authors.getInitials(),
                        //     style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ],
                ),
                // () {
                //   if (book.rating != 0.0) {
                //     return RatingBarIndicator(
                //       itemBuilder: (context, index) {
                //         return Icon(Icons.star,
                //             color: Theme.of(context).colorScheme.secondary);
                //       },
                //       itemSize: MediaQuery.of(context).size.width / 11,
                //       itemCount: 10,
                //       rating: book.rating ?? 0.0,
                //     );
                //   }
                //   return const SizedBox();
                // }(),

                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.star_outline),
                    Text(book.rating != 0.0
                        ? '${book.rating}/10'
                        : 'Отзывов ещё нет'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
