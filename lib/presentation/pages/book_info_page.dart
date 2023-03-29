import 'package:flutter/material.dart';

import '../../data/models/author.dart';
import '../../data/models/book.dart';

class BookInfoPage extends StatelessWidget {
  const BookInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Book? book = ModalRoute.of(context)!.settings.arguments as Book?;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${book?.title}",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(book!.image!),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
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
                    const Spacer(),
                    const Icon(Icons.star_outline),
                    Text(book.rating != 0.0
                        ? '${book.rating}/10'
                        : 'Отзывов ещё нет'),
                  ],
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Год выпуска: ${book.yearOfIssue}'),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/read-book', arguments: book);
                      },
                      child: const Text(
                        'ЧИТАТЬ',
                        style: TextStyle(fontSize: 20),
                      ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
