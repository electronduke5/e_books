import 'package:e_books/data/api_service.dart';
import 'package:e_books/data/utils/constants.dart';
import 'package:e_books/domain/repository/book_repository.dart';
import 'package:e_books/presentation/di/app_module.dart';

import '../models/book.dart';

class BookRepositoryImpl with ApiService<Book> implements BookRepository {
  @override
  Future<List<Book>> getAllBooks() {
    apiRoute = ApiConstUrl.bookUrl;
    return getAll(fromJson: (Map<String, dynamic> json) => Book.fromJson(json));
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
}
