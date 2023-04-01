import '../../data/models/book.dart';

abstract class BookRepository{
  Future<List<Book>> getAllBooks();
  Future<List<Book>> getUserBookmarks();
  Future<Book?> addBookmark({required int bookId,});
}