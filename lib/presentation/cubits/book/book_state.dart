part of 'book_cubit.dart';

class BookState {
  final ApiStatus<List<Book>> booksStatus;
  final ApiStatus<Book> bookmarkStatus;
  final ApiStatus<Book> addBookStatus;
  final ApiStatus<Book> buyBookStatus;
  final File? image;
  final File? book;

  BookState({
    this.booksStatus = const IdleStatus(),
    this.buyBookStatus = const IdleStatus(),
    this.addBookStatus = const IdleStatus(),
    this.bookmarkStatus = const IdleStatus(),
    this.book,
    this.image,
  });

  BookState copyWith({
    ApiStatus<List<Book>>? booksStatus,
    ApiStatus<Book>? bookmarkStatus,
    ApiStatus<Book>? addBookStatus,
    ApiStatus<Book>? buyBookStatus,
    File? image ,
    File? book ,
  }) =>
      BookState(
        booksStatus: booksStatus ?? this.booksStatus,
        bookmarkStatus: bookmarkStatus ?? this.bookmarkStatus,
        addBookStatus: addBookStatus ?? this.addBookStatus,
        buyBookStatus: buyBookStatus ?? this.buyBookStatus,
        image: image ?? this.image,
        book: book ?? this.book,
      );
}
