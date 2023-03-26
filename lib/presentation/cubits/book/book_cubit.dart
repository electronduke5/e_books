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
      emit(
          state.copyWith(booksStatus: FailedStatus(state.booksStatus.message)));
      print(state.booksStatus.message);
      print(exception.toString());
      return null;
    }
  }
}
