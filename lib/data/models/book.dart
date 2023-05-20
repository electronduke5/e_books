import 'package:e_books/data/models/review.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'author.dart';

part '../../domain/models/book/book.freezed.dart';
part '../../domain/models/book/book.g.dart';

@freezed
class Book with _$Book {
  const factory Book({
    required int id,
    required String title,
    required String yearOfIssue,
    String? image,
    String? file,
    double? rating,
    double? price,
    List<Author>? authors,
    List<Review>? reviews,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}
