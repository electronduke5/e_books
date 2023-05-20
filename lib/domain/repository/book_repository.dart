import 'dart:io';

import '../../data/models/book.dart';

abstract class BookRepository{
  Future<List<Book>> getAllBooks();
  Future<List<Book>> getUserBookmarks();
  Future<Book?> addBookmark({required int bookId,});
  Future<Book?> addBook({required String title, required int yearOfIssue, required File image, required File book});
}