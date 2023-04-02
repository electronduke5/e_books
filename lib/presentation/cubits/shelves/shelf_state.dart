part of 'shelf_cubit.dart';

class ShelfState {
  final ApiStatus<List<Shelf>> shelvesStatus;
  final ApiStatus<Shelf> createShelfStatus;
  final ApiStatus<Shelf> shelfByIdStatus;
  final ApiStatus<void> deleteStatus;

  final ApiStatus<Shelf> addBookToShelfStatus;
  final ApiStatus<void> deleteBookStatus;

  const ShelfState({
    this.shelvesStatus = const IdleStatus(),
    this.createShelfStatus = const IdleStatus(),
    this.deleteStatus = const IdleStatus(),
    this.deleteBookStatus = const IdleStatus(),
    this.addBookToShelfStatus = const IdleStatus(),
    this.shelfByIdStatus = const IdleStatus(),
  });

  ShelfState copyWith({
    ApiStatus<List<Shelf>>? shelvesStatus,
    ApiStatus<Shelf>? createShelfStatus,
    ApiStatus<Shelf>? addBookToShelfStatus,
    ApiStatus<Shelf>? shelfByIdStatus,
    ApiStatus<void>? deleteStatus,
    ApiStatus<void>? deleteBookStatus,
  }) {
    return ShelfState(
      shelvesStatus: shelvesStatus ?? this.shelvesStatus,
      createShelfStatus: createShelfStatus ?? this.createShelfStatus,
      deleteStatus: deleteStatus ?? this.deleteStatus,
      deleteBookStatus: deleteBookStatus ?? this.deleteBookStatus,
      addBookToShelfStatus: addBookToShelfStatus ?? this.addBookToShelfStatus,
      shelfByIdStatus: shelfByIdStatus ?? this.shelfByIdStatus,
    );
  }
}
