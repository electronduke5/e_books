import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/book.dart';
import '../cubits/book/book_cubit.dart';
import '../widgets/custom_search_delegate.dart';
import '../widgets/popup_icon_item.dart';

class BooksPage extends StatelessWidget {
  BooksPage({Key? key}) : super(key: key);

  Book? book;
  List<Book> allBooks = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: AppBar(
          title: const Text(
            'Книги',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(books: allBooks),
                  );
                },
                icon: const Icon(Icons.search)),
            PopupMenuButton<String>(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              onSelected: (value) async {
                allBooks = await _onSelected(
                    context: context, value: value, books: allBooks);
              },
              icon: const Icon(Icons.filter_list),
              itemBuilder: (context) {
                return [
                  PopupIconMenuItem(
                    title: 'По возрастанию рейтинга',
                    icon: Icons.arrow_upward,
                  ),
                  PopupIconMenuItem(
                    title: 'По убыванию рейтинга',
                    icon: Icons.arrow_downward,
                  ),
                ];
              },
            ),
          ],
        ),
    );
  }

  Future<List<Book>> _onSelected(
      {required BuildContext context,
        required List<Book> books,
        required String value}) async {
    switch (value) {
      case 'По возрастанию рейтинга':
        await context
            .read<BookCubit>()
            .loadBooks()
            .then((value) => allBooks = value!);
        books.sort((a, b) => a.rating!.compareTo(b.rating!));
        break;
      case 'По убыванию рейтинга':
        await context
            .read<BookCubit>()
            .loadBooks()
            .then((value) => allBooks = value!);
        books.sort((b, a) => a.rating!.compareTo(b.rating!));
        break;
    }
    return books;
  }
}
