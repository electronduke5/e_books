import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_books/data/api_service.dart';
import 'package:e_books/data/utils/constants.dart';
import 'package:e_books/domain/repository/book_repository.dart';
import 'package:e_books/presentation/di/app_module.dart';

import '../models/book.dart';
import '../models/user.dart';

class BookRepositoryImpl with ApiService<Book> implements BookRepository {
  @override
  Future<List<Book>> getAllBooks({User? user}) {
    apiRoute = ApiConstUrl.bookUrl;
    return getAll(
      fromJson: (Map<String, dynamic> json) => Book.fromJson(json),
      params: {'user': user?.id},
    );
  }

  @override
  Future<Book?> addBookmark({
    required int bookId,
  }) {
    apiRoute = ApiConstUrl.bookmarkUrl;
    return post(
      fromJson: (Map<String, dynamic> json) => Book.fromJson(json),
      data: {
        'user_id': AppModule.getProfileHolder().user.id,
        'book_id': bookId,
      },
    );
  }

  @override
  String apiRoute = ApiConstUrl.bookUrl;

  @override
  Future<List<Book>> getUserBookmarks() {
    apiRoute = ApiConstUrl.bookmarkUrl;
    return getAll(
      fromJson: (Map<String, dynamic> json) => Book.fromJson(json),
      params: {'user': AppModule.getProfileHolder().user.id},
    );
  }

  @override
  Future<Book?> addBook(
      {required String title,
        required int yearOfIssue,
        required File image,
        required File book,
        int? user_id}) async {
    apiRoute = ApiConstUrl.bookUrl;
    return post(
        fromJson: (Map<String, dynamic> json) => Book.fromJson(json),
        data: {
          'title': title,
          'year_of_issue': yearOfIssue,
          'image': await MultipartFile.fromFile(image.path),
          'file': await MultipartFile.fromFile(book.path),
          'user_id': user_id
        });
  }

  @override
  Future<Book?> buyBook({required int bookId, required int userId}) {
    apiRoute = ApiConstUrl.buyBookUrl;
    return post(
      fromJson: (Map<String, dynamic> json) => Book.fromJson(json),
      data: {
        'user_id' : userId,
        'book_id' : bookId,
      },
    );
  }
}
