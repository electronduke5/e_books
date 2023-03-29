import 'package:freezed_annotation/freezed_annotation.dart';

import 'book.dart';

part '../../domain/models/author/author.g.dart';
part '../../domain/models/author/author.freezed.dart';

@freezed
class Author with _$Author {
  const factory Author({
    required int id,
    required String surname,
    required String name,
    required String patronymic,
    required String information,
    List<Book>? books
  }) = _Author;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  String getFullName() => '$surname $name $patronymic';

  String getSurnameName() => '$surname $name';

  String getInitials() {
    return patronymic == null
        ? '${name[0]}. $surname'
        : '${name[0]}.${patronymic[0]}. $surname';
  }
}
