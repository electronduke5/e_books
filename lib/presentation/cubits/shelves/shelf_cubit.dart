import 'package:e_books/data/models/shelf.dart';
import 'package:e_books/presentation/cubits/models_status.dart';
import 'package:e_books/presentation/di/app_module.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shelf_state.dart';

class ShelfCubit extends Cubit<ShelfState> {
  ShelfCubit() : super(const ShelfState());

  Future<List<Shelf>?> loadShelves() async {
    final repository = AppModule.getShelfRepository();
    emit(state.copyWith(shelvesStatus: LoadingStatus()));

    try {
      final List<Shelf> shelves = await repository.getUserShelves();
      emit(state.copyWith(shelvesStatus: LoadedStatus(item: shelves)));
      return shelves;
    } catch (e) {
      emit(state.copyWith(shelvesStatus: FailedStatus(state.shelvesStatus.message)));
      return null;
    }
  }

  Future<Shelf?> createShelf(String title) async {
    final repository = AppModule.getShelfRepository();
    emit(state.copyWith(createShelfStatus: LoadingStatus()));

    try {
      final Shelf shelf = await repository.createShelf(title: title);
      emit(state.copyWith(createShelfStatus: LoadedStatus(item: shelf)));
      return shelf;
    } catch (e) {
      emit(state.copyWith(createShelfStatus: FailedStatus(state.shelvesStatus.message)));
      return null;
    }
  }

  Future deleteShelf(Shelf shelf) async {
    final repository = AppModule.getShelfRepository();
    emit(state.copyWith(deleteStatus: LoadingStatus()));
    try {
      await repository.deleteShelf(shelf.id);
      emit(state.copyWith(deleteStatus: LoadedStatus()));
    } catch (e) {
      emit(state.copyWith(deleteStatus: FailedStatus(state.deleteStatus.message)));
    }
  }
}
