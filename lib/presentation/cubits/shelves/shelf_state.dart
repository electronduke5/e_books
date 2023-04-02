part of 'shelf_cubit.dart';

class ShelfState {
  final ApiStatus<List<Shelf>> shelvesStatus;
  final ApiStatus<Shelf> createShelfStatus;
  final ApiStatus<void> deleteStatus;

  const ShelfState({
    this.shelvesStatus = const IdleStatus(),
    this.createShelfStatus = const IdleStatus(),
    this.deleteStatus = const IdleStatus(),
  });

  ShelfState copyWith({
    ApiStatus<List<Shelf>>? shelvesStatus,
    ApiStatus<Shelf>? createShelfStatus,
    ApiStatus<void>? deleteStatus,
  }) {
    return ShelfState(
      shelvesStatus: shelvesStatus ?? this.shelvesStatus,
      createShelfStatus: createShelfStatus ?? this.createShelfStatus,
      deleteStatus: deleteStatus ?? this.deleteStatus,
    );
  }
}
