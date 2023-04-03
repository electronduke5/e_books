import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import 'book.dart';
import 'user.dart';

part '../../domain/models/review/review.freezed.dart';
part '../../domain/models/review/review.g.dart';

@freezed
class Review with _$Review {
  const factory Review({
    required int id,
    required String description,
    required User author,
    required Book book,
    required int rating,
    required DateTime dateCreated,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  String getDate(){
    return  DateFormat('dd.MM.yyyy').format(dateCreated);
  }
}
