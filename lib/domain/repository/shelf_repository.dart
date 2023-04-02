import '../../data/models/shelf.dart';

abstract class ShelfRepository{
  Future<List<Shelf>> getUserShelves();
  Future<Shelf> createShelf({required String title});
  Future deleteShelf(int id);
}