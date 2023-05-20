import 'dart:io';

import 'package:e_books/data/models/book.dart';
import 'package:e_books/data/utils/image_picker.dart';
import 'package:e_books/presentation/cubits/book/book_cubit.dart';
import 'package:e_books/presentation/cubits/models_status.dart';
import 'package:e_books/presentation/widgets/book_cover_text.dart';
import 'package:e_books/presentation/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartPage extends StatelessWidget {
  StartPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController titleController =
      TextEditingController(text: 'Иди туда где трудно');
  final TextEditingController yearController =
      TextEditingController(text: '2020');
  final TextEditingController rating = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocListener<BookCubit, BookState>(
        listener: (context, state) {
          print(
              'state.addBookStatus.runtimeType: ${state.addBookStatus.runtimeType}');
          if (state.addBookStatus is LoadedStatus<Book>) {
            SnackBarInfo.show(
                context: context,
                message: 'Книга успешно добавлена!',
                isSuccess: true);
          }

          if (state.addBookStatus is FailedStatus<Book>) {
            SnackBarInfo.show(
                context: context,
                message: 'Ошибка при добавлении книги',
                isSuccess: false);
          }
        },
        child: Column(
          children: [
            AppBar(
              title: const Text(
                'Добавление книги',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text('Для начала нужно добавить автора новой книги:'),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: titleController,
                    validator: (value) {
                      if (value?.trim().isNotEmpty == true) {
                        return null;
                      }
                      return "Это обязательное поле";
                    },
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10.0),
                      labelText: 'Название книги',
                      prefixIcon: const Icon(Icons.book_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Война и мир',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: yearController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value?.trim().isNotEmpty == true) {
                        return null;
                      }
                      return "Это обязательное поле";
                    },
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10.0),
                      labelText: 'Год выпуска',
                      prefixIcon: const Icon(Icons.book_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: '2012',
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    child: Text('Добавить обложку'),
                    onPressed: () async {
                      await ImageHelper().getFromGallery().then((value) {
                        if (value != null) {
                          context.read<BookCubit>().imageChanged(value);
                        }
                      });
                    },
                  ),
                  BlocBuilder<BookCubit, BookState>(
                    builder: (context, state) {
                      if (state.image != null) {
                        return SizedBox(
                          height: 150,
                          width: 100,
                          child: Image.file(File(state.image!.path)),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                  ElevatedButton(
                    child: Text('Добавить книгу'),
                    onPressed: () async {
                      await ImageHelper().getFile().then((value) {
                        if (value != null) {
                          context.read<BookCubit>().fileChanged(value);
                        }
                      });
                    },
                  ),
                  BlocBuilder<BookCubit, BookState>(
                    builder: (context, state) {
                      if (state.book != null) {
                        return Text(state.book?.path ?? 'asd');
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                  BlocBuilder<BookCubit, BookState>(builder: (context, state) {
                    return TextButton(
                      onPressed: () async {
                        print(
                            'validate key in add book: ${_formKey.currentState?.validate() ?? false}');
                        print(yearController.value.text);
                        print('image: ${state.image!.path}');
                        print('file: ${state.book!.path}');
                        if (_formKey.currentState?.validate() ?? false) {
                          await context
                              .read<BookCubit>()
                              .addBook(
                                  image: state.image!,
                                  file: state.book!,
                                  title: titleController.value.text,
                                  yearOfIssue:
                                      int.parse(yearController.value.text))
                              .then((value) {
                            if (value != null) {
                              Navigator.pop(context, value);
                            }
                          });
                        }
                      },
                      child: () {
                        if (state.addBookStatus is LoadingStatus<Book>) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return const Text("Далее");
                      }(),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
