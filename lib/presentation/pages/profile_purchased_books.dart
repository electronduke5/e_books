import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../data/models/book.dart';
import '../cubits/book/book_cubit.dart';
import '../widgets/book_widget.dart';

class PurchasedBooksPage extends StatelessWidget {
  PurchasedBooksPage({Key? key}) : super(key: key);

  List<Book> books = [];

  @override
  Widget build(BuildContext context) {
    books = ModalRoute.of(context)?.settings.arguments as List<Book>;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ваши купленные книги',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: MasonryGridView.count(
          crossAxisCount: 2,
          itemCount: books.length,
          itemBuilder: (BuildContext context, int index) {
            return BookWidget(book: books[index]);
          },
        ),
      ),
    );
  }
}
