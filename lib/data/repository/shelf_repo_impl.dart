import 'package:e_books/data/utils/constants.dart';
import 'package:e_books/presentation/di/app_module.dart';

import '../../domain/repository/shelf_repository.dart';
import '../api_service.dart';
import '../models/shelf.dart';

class ShelfRepositoryImpl with ApiService<Shelf> implements ShelfRepository {
  @override
  Future<List<Shelf>> getUserShelves() {
    apiRoute = ApiConstUrl.shelfUrl;
    return getAll(
      fromJson: (Map<String, dynamic> json) => Shelf.fromJson(json),
      params: {'user': AppModule.getProfileHolder().user.id},
    );
  }

  @override
  String apiRoute = ApiConstUrl.shelfUrl;

  @override
  Future<Shelf> createShelf({required String title}) {
    apiRoute = ApiConstUrl.shelfUrl;
    return post(
      fromJson: (Map<String, dynamic> json) => Shelf.fromJson(json),
      data: {
        'title': title,
        'user_id': AppModule.getProfileHolder().user.id,
      },
    );
  }

  @override
  Future deleteShelf(int id) {
    apiRoute = ApiConstUrl.shelfUrl;
    return delete(id);
  }

  @override
  Future<Shelf> addBookToShelf({required int bookId, required int shelfId}) {
    apiRoute = ApiConstUrl.bookshelfUrl;
    return post(fromJson: (Map<String, dynamic> json) => Shelf.fromJson(json), data: {
      'book_id': bookId,
      'shelf_id': shelfId,
    });
  }

  @override
  Future deleteBookshelf({
    required int bookId,
    required int shelfId,
  }) {
    apiRoute = ApiConstUrl.bookshelfUrl;
    return getDelete(
      params: {
        'book': bookId,
        'shelf': shelfId,
        'delete': true,
      },
    );
  }

  @override
  Future<Shelf> getShelfById(int id) {
    apiRoute = ApiConstUrl.shelfUrl;
    return get(
      fromJson: (Map<String, dynamic> json) => Shelf.fromJson(json),
      id: id,
    );
  }
}
