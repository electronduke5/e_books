import 'package:e_books/presentation/cubits/book/book_cubit.dart';
import 'package:e_books/presentation/widgets/book_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../data/models/book.dart';
import '../../data/models/user.dart';
import '../cubits/models_status.dart';

class ProfileBooksPage extends StatefulWidget {
  const ProfileBooksPage({Key? key}) : super(key: key);

  @override
  State<ProfileBooksPage> createState() => _ProfileBooksPageState();
}

class _ProfileBooksPageState extends State<ProfileBooksPage> {
  User? user;
  List<Book> userBooks = [];

  @override
  Widget build(BuildContext context) {
    user = ModalRoute.of(context)?.settings.arguments as User?;

    setState(() {
      context.read<BookCubit>().loadBooks(user: user);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Книги автора ${user?.surname ?? ''} ${user?.name ?? ''}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<BookCubit, BookState>(
          builder: (context, state) {
            print('state in profile Books: ${state.booksStatus.runtimeType}');
            switch (state.booksStatus.runtimeType) {
              case LoadingStatus<List<Book>>:
                return const Center(child: CircularProgressIndicator());
              case FailedStatus:
                return const Center(
                    child: Text('Ошибка при получении книг пользователя'));
              case LoadedStatus<List<Book>>:
                return MasonryGridView.count(
                  crossAxisCount: 2,
                  itemCount: state.booksStatus.item!.length,
                  itemBuilder: (BuildContext context, int index) {
                    print(state.booksStatus.item!.length);
                    print(
                        '---allBooks.length: ${state.booksStatus.item!.length}');
                    return BookWidget(book: state.booksStatus.item![index]);
                  },
                );
              default:
                return const Center(child: Text('Ошибка при получении книг'));
            }
          },
        ),
      ),
    );
  }
}
