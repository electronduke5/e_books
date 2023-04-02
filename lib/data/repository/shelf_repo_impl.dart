import 'package:e_books/data/utils/constants.dart';
import 'package:e_books/presentation/di/app_module.dart';

import '../../domain/repository/shelf_repository.dart';
import '../api_service.dart';
import '../models/shelf.dart';

class ShelfRepositoryImpl with ApiService<Shelf> implements ShelfRepository {
  @override
  Future<List<Shelf>> getUserShelves() {
    return getAll(
      fromJson: (Map<String, dynamic> json) => Shelf.fromJson(json),
      params: {'user': AppModule.getProfileHolder().user.id},
    );
  }

  @override
  String apiRoute = ApiConstUrl.shelfUrl;

  @override
  Future<Shelf> createShelf({required String title}) {
    return post(
      fromJson: (Map<String, dynamic> json) => Shelf.fromJson(json),
      data: {
        'title': title,
        'user_id': AppModule.getProfileHolder().user.id,
      },
    );
  }

  @override
  Future deleteShelf(int id) => delete(id);
}
