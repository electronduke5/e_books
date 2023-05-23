import 'dart:io';

import '../../data/models/book.dart';
import '../../data/models/user.dart';

abstract class BookRepository {
  Future<List<Book>> getAllBooks({User? user});

  Future<List<Book>> getUserBookmarks();

  Future<Book?> addBookmark({required int bookId});

  Future<Book?> buyBook({required int bookId, required int userId});

  Future<Book?> addBook({
    required String title,
    required int yearOfIssue,
    required File image,
    required File book,
    int? user_id,
  });
}