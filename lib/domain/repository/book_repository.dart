import '../../data/models/book.dart';

abstract class BookRepository{
  Future<List<Book>> getAllBooks();
  Future<Book?> addBookmark({required int bookId,});
}