part of 'book_cubit.dart';

class BookState {
  final ApiStatus<List<Book>> booksStatus;

  BookState({
    this.booksStatus = const IdleStatus(),
  });

  BookState copyWith({
    ApiStatus<List<Book>>? booksStatus,
  }) =>
      BookState(
        booksStatus: booksStatus ?? this.booksStatus,
      );
}
