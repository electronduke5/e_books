part of 'book_cubit.dart';

class BookState {
  final ApiStatus<List<Book>> booksStatus;
  final ApiStatus<Book> bookmarkStatus;

  BookState({
    this.booksStatus = const IdleStatus(),
    this.bookmarkStatus = const IdleStatus(),
  });

  BookState copyWith({
    ApiStatus<List<Book>>? booksStatus,
    ApiStatus<Book>? bookmarkStatus,
  }) =>
      BookState(
        booksStatus: booksStatus ?? this.booksStatus,
        bookmarkStatus: bookmarkStatus ?? this.bookmarkStatus,
      );
}
