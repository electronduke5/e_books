import '../../data/models/shelf.dart';

abstract class ShelfRepository{
  Future<List<Shelf>> getUserShelves();

  Future<Shelf> createShelf({required String title});

  Future deleteShelf(int id);

  Future<Shelf> addBookToShelf({required int bookId, required int shelfId});

  Future deleteBookshelf({
    required int bookId,
    required int shelfId,
  });

  Future<Shelf> getShelfById(int id);
}