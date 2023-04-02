import 'package:e_books/presentation/cubits/shelves/shelf_cubit.dart';
import 'package:e_books/presentation/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../data/models/shelf.dart';
import '../widgets/book_widget.dart';

class BookshelfPage extends StatefulWidget {
  const BookshelfPage({Key? key}) : super(key: key);

  @override
  State<BookshelfPage> createState() => _BookshelfPageState();
}

class _BookshelfPageState extends State<BookshelfPage> {
  Shelf? shelf;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    shelf = ModalRoute.of(context)!.settings.arguments as Shelf?;
    return Scaffold(
      appBar: AppBar(
        title: Text(shelf!.title),
      ),
      body: SafeArea(
        child: MasonryGridView.count(
          crossAxisCount: 2,
          itemCount: shelf?.books?.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                OutlinedButton(
                  onPressed: () async {
                    Shelf? updatedShelf;
                    await context
                        .read<ShelfCubit>()
                        .deleteBookFromShelf(
                            bookId: shelf!.books![index].id, shelfId: shelf!.id)
                        .then((value) async {
                      SnackBarInfo.show(
                          context: context,
                          message: 'Книга удалена из полки',
                          isSuccess: true);
                      updatedShelf = await context
                          .read<ShelfCubit>()
                          .getShelfById(shelf!.id)
                          .then((value) {
                        print('new shelf: ${value}');
                        print('old shelf2: ${shelf}');
                      });
                    });
                    setState(() {
                      shelf = updatedShelf ?? shelf;
                    });
                  },
                  child: const Text('Удалить из полки'),
                ),
                BookWidget(book: shelf!.books![index]),
              ],
            );
          },
        ),
      ),
    );
  }
}
