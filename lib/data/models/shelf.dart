import 'package:e_books/data/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'book.dart';

part '../../domain/models/shelf/shelf.freezed.dart';
part '../../domain/models/shelf/shelf.g.dart';

@freezed
class Shelf with _$Shelf {
  const factory Shelf({
    required int id,
    required String title,
    required User owner,
    required List<Book> books,
  }) = _Shelf;

  factory Shelf.fromJson(Map<String, dynamic> json) => _$ShelfFromJson(json);
}
