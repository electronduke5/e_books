import 'package:bloc/bloc.dart';

import '../../../data/models/book.dart';
import '../../di/app_module.dart';
import '../models_status.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookState());

  Future<List<Book>?> loadBooks() async {
    final repository = AppModule.getBookRepository();
    emit(state.copyWith(booksStatus: LoadingStatus()));
    try {
      final List<Book> books = await repository.getAllBooks();
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
      print('---there2');
      return book == null ? false : true;
    } catch (exception) {
      emit(state.copyWith(bookmarkStatus: FailedStatus(state.booksStatus.message)));
      print(state.booksStatus.message);
      print(exception.toString());
      return null;
    }
  }
}
