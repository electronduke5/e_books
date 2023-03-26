import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../data/models/author.dart';
import '../../data/models/book.dart';

class BookWidget extends StatelessWidget {
  const BookWidget({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: InkWell(
        onTap: () async {
          //context.read<ReviewCubit>().loadReviews(filter: 'book', value: book.id).then((value) {
          Navigator.of(context).pushNamed('/book-review', arguments: book);

          //});
        },
        child: Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        () {
                          if (book.authors == []) {
                            return Text('Авторов нет');
                          }
                          for (Author author in book.authors!) {
                            return Text(author.getFullName(),
                                style: Theme.of(context).textTheme.bodySmall);
                          }
                          return Text('asd');
                        }(),
                        // Text(book.authors.getInitials(),
                        //     style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ],
                ),
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
                            height: 350,
                            width: 250,
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
                                  return Text('asd');
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
                    child: Image.network(book.image!),
                  );
                }(),
                const SizedBox(height: 15),
                // Text(
                //   book. ?? "Описание пустое",
                //   style: Theme.of(context).textTheme.bodyLarge,
                // ),
                // const SizedBox(height: 10),
                //const Divider(indent: 10, endIndent: 10, thickness: 0.1),
                () {
                  if (book.rating != 0.0) {
                    return RatingBarIndicator(
                      itemBuilder: (context, index) {
                        return Icon(Icons.star,
                            color: Theme.of(context).colorScheme.secondary);
                      },
                      itemSize: MediaQuery.of(context).size.width / 11,
                      itemCount: 10,
                      rating: book.rating ?? 0.0,
                    );
                  }
                  return const SizedBox();
                }(),

                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.star_outline),
                    Text(book.rating != 0.0
                        ? 'Оценка книги: ${book.rating}/10'
                        : 'Отзывов ещё нет'),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.library_books_outlined),
                    Text('Год выпуска: ${book.yearOfIssue}'),
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
