import 'dart:io';

import 'package:bloc/bloc.dart';

import '../../../data/models/book.dart';
import '../../../data/models/user.dart';
import '../../di/app_module.dart';
import '../models_status.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookState());

  Future<List<Book>?> loadBooks({User? user}) async {
    final repository = AppModule.getBookRepository();
    emit(state.copyWith(booksStatus: LoadingStatus()));
    try {
      final List<Book> books = await repository.getAllBooks(user: user);
      emit(state.copyWith(booksStatus: LoadedStatus(item: books)));
      print('books: $books');
      print('---there2');
      return books;
    } catch (exception) {
      emit(state.copyWith(booksStatus: FailedStatus(state.booksStatus.message)));
      print(state.booksStatus.message);
      print(exception.toString());
      return null;
    }
  }

  Future<Book?> loadBook({required Book book}) async {
    final repository = AppModule.getBookRepository();
    emit(state.copyWith(loadBookStatus: LoadingStatus()));
    try {
      final Book foundBook = await repository.getBook(bookId: book.id);
      emit(state.copyWith(loadBookStatus: LoadedStatus<Book>(item: foundBook)));
      return foundBook;
    } catch (exception) {
      emit(state.copyWith(loadBookStatus: FailedStatus(state.booksStatus.message)));
      print(state.booksStatus.message);
      print(exception.toString());
      return null;
    }
  }

  Future<Book?> addBook(
      {required String title,
      required int yearOfIssue,
      required File image,
      required File file,
      User? user}) async {
    final repository = AppModule.getBookRepository();
    emit(state.copyWith(addBookStatus: LoadingStatus()));
    try {
      int? roleId = user?.role?.id;
      final Book? book = await repository.addBook(
          title: title,
          yearOfIssue: yearOfIssue,
          image: image,
          book: file,
          user_id: roleId == 2 ? roleId : null);
      emit(state.copyWith(addBookStatus: LoadedStatus(item: book)));
      emit(state.copyWith(addBookStatus: const IdleStatus()));
      print('books: $book');
      print('---there2');
      return book;
    } catch (exception) {
      emit(state.copyWith(addBookStatus: FailedStatus(state.booksStatus.message)));
      print(state.booksStatus.message);
      print(exception.toString());
      emit(state.copyWith(addBookStatus: const IdleStatus()));
      return null;
    }
  }

  Future<List<Book>?> loadBookmarks() async {
    final repository = AppModule.getBookRepository();
    emit(state.copyWith(booksStatus: LoadingStatus()));
    try {
      final List<Book> books = await repository.getUserBookmarks();
      emit(state.copyWith(booksStatus: LoadedStatus(item: books)));
      print('books: $books');
      print('---there2');
      return books;
    } catch (exception) {
      emit(state.copyWith(booksStatus: FailedStatus(state.booksStatus.message)));
      print(state.booksStatus.message);
      print(exception.toString());
      return null;
    }
  }

  Future<bool?> addBookmark(int bookId) async {
    final repository = AppModule.getBookRepository();
    emit(state.copyWith(bookmarkStatus: LoadingStatus()));
    try {
      final Book? book = await repository.addBookmark(bookId: bookId);
      emit(state.copyWith(bookmarkStatus: LoadedStatus(item: book)));
      print('book: $book');
      return book == null ? false : true;
    } catch (exception) {
      emit(state.copyWith(bookmarkStatus: FailedStatus(state.booksStatus.message)));
      print(state.booksStatus.message);
      print(exception.toString());
      return null;
    }
  }

  Future<Book?> buyBook(int bookId, int userId) async {
    final repository = AppModule.getBookRepository();
    emit(state.copyWith(buyBookStatus: LoadingStatus()));
    try {
      final Book? book = await repository.buyBook(bookId: bookId, userId: userId);
      emit(state.copyWith(buyBookStatus: LoadedStatus(item: book)));
      emit(state.copyWith(buyBookStatus: const IdleStatus()));
      print('book: $book');
      return book;
    } catch (exception) {
      emit(state.copyWith(
          buyBookStatus:
              FailedStatus(state.booksStatus.message ?? exception.toString())));
      emit(state.copyWith(buyBookStatus: const IdleStatus()));
      print(state.booksStatus.message);
      print(exception.toString());
      return null;
    }
  }

  Future<void> imageChanged(File file) async {
    emit(state.copyWith(image: file, book: state.book));
  }

  Future<void> removeImage() async {
    emit(state.copyWith(image: null, book: state.book));
  }

  Future<void> removeBook() async {
    emit(state.copyWith(book: null, image: state.image));
  }

  Future<void> fileChanged(File file) async {
    emit(state.copyWith(book: file, image: state.image));
  }
}
