import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/book.dart';
import '../cubits/book/book_cubit.dart';
import '../cubits/models_status.dart';
import '../widgets/book_widget.dart';
import '../widgets/custom_search_delegate.dart';
import '../widgets/popup_icon_item.dart';

class BooksPage extends StatelessWidget {
  BooksPage({Key? key}) : super(key: key);

  Book? book;
  List<Book> allBooks = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AppBar(
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
          const SizedBox(height: 5),
          Expanded(
            child: buildBooksList(context),
          ),
        ],
      ),
    );
  }

  Widget buildBooksList(BuildContext context) {
    return RefreshIndicator(onRefresh: () async {
      await context.read<BookCubit>().loadBooks();
    }, child: BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        print('booksStatus: ${state.booksStatus.runtimeType}');
        switch (state.booksStatus.runtimeType) {
          case LoadingStatus<List<Book>>:
            return const Center(child: CircularProgressIndicator());
          case LoadedStatus<List<Book>>:
            print('item in bookstatus: ${state.booksStatus.item}');
            if (state.booksStatus.item == null) {
              return const Center(child: CircularProgressIndicator());
            }
            allBooks.isEmpty ? allBooks = state.booksStatus.item! : () {};
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    clipBehavior: Clip.antiAlias,
                    physics: const BouncingScrollPhysics(),
                    itemCount: allBooks.length,
                    itemBuilder: (context, index) {
                      return BookWidget(book: allBooks[index]);
                    },
                  ),
                ),
                const SizedBox(height: 65),
              ],
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    ));
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
