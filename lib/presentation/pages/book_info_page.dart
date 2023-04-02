import 'package:collection/collection.dart';
import 'package:e_books/presentation/cubits/book/book_cubit.dart';
import 'package:e_books/presentation/cubits/models_status.dart';
import 'package:e_books/presentation/di/app_module.dart';
import 'package:e_books/presentation/widgets/book_cover_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/author.dart';
import '../../data/models/book.dart';
import '../../data/models/shelf.dart';
import '../../data/models/user.dart';
import '../cubits/shelves/shelf_cubit.dart';
import '../widgets/snack_bar.dart';

class BookInfoPage extends StatelessWidget {
  BookInfoPage({Key? key}) : super(key: key);

  final scaffoldState = GlobalKey<ScaffoldState>();

  bool checkBookmark(Book? book) {
    User user = AppModule.getProfileHolder().user;
    if (user.bookmarks == null) return false;
    if (user.bookmarks!.isEmpty) return false;
    Book? bookmark =
        user.bookmarks?.firstWhereOrNull((element) => element.id == book?.id);
    if (bookmark == null) return false;
    return true;
  }

  bool isBookmarkChecked = false;

  @override
  Widget build(BuildContext context) {
    Book? book = ModalRoute.of(context)!.settings.arguments as Book?;
    isBookmarkChecked = checkBookmark(book);
    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
        title: Text(
          "${book?.title}",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        actions: [
          BlocBuilder<BookCubit, BookState>(
            builder: (ctx, state) {
              return IconButton(
                onPressed: () async {
                  await context
                      .read<BookCubit>()
                      .addBookmark(book!.id)
                      .then((value) => isBookmarkChecked = value ?? false);
                },
                //icon: Icon(checkBookmark(book) ? Icons.bookmark : Icons.bookmark_border, color: Colors.yellow,),
                icon: Icon(
                  isBookmarkChecked ? Icons.bookmark : Icons.bookmark_border,
                  color: Colors.yellow,
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                    () {
                  if (book!.image == null) {
                    return BookCoverText(book: book);
                  }
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(book.image!),
                  );
                }(),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            book?.title ?? 'Название книги',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                            () {
                          if (book!.authors == []) {
                            return const Text('Авторов нет');
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Text(book?.rating != 0.0
                          ? '${book?.rating ?? '0'}/10'
                          : 'Отзывов ещё нет'),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Год выпуска: ${book?.yearOfIssue ?? '0000'}'),
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
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    _showSheet(book!.id);
                  },
                  child: const Text(
                    'Добавить на полку',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSheet(int bookId) async {
    BuildContext context = scaffoldState.currentContext!;
    final shelves = await  context.read<ShelfCubit>().loadShelves();
    scaffoldState.currentState?.showBottomSheet(
      (context) => BlocListener<ShelfCubit, ShelfState>(
        listener: (context, state) {},
        child: SizedBox(
          height: 220,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  'Выберите полку',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                BlocBuilder<ShelfCubit,ShelfState>(
                  builder: (context,state) {
                    print('shelves status in book_info_page: ${state.shelvesStatus.runtimeType}');
                    if(state.shelvesStatus.runtimeType == LoadingStatus<List<Shelf>>){
                      return const Center(child: CircularProgressIndicator(),);
                    }

                    if(state.shelvesStatus.runtimeType == LoadedStatus<List<Shelf>>){
                      return Expanded(
                        child: ListView.builder(
                          itemCount: shelves!.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                // shape: RoundedRectangleBorder(
                                //   borderRadius: BorderRadius.circular(10),
                                // ),
                                //tileColor: Theme.of(context).colorScheme.secondaryContainer,
                                title: Text(shelves[index].title),
                                onTap: () async {
                                  await context
                                      .read<ShelfCubit>()
                                      .addBookToShelf(
                                      bookId: bookId, shelfId: shelves[index].id)
                                      .then((value) {
                                    Navigator.of(context).pop();
                                    SnackBarInfo.show(
                                        context: context,
                                        message:
                                        "Книга добавлена на полку '${shelves[index].title}'",
                                        isSuccess: true);
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return SizedBox();

                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
