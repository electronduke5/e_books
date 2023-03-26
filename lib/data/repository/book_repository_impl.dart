import 'package:e_books/data/api_service.dart';
import 'package:e_books/data/utils/constants.dart';
import 'package:e_books/domain/repository/book_repository.dart';

import '../models/book.dart';

class BookRepositoryImpl with ApiService<Book> implements BookRepository {
  @override
  String apiRoute = ApiConstUrl.bookUrl;

  @override
  Future<List<Book>> getAllBooks() {
    print('---there');
    return getAll(fromJson: (Map<String, dynamic> json) => Book.fromJson(json));
  }
}
