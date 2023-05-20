import 'package:e_books/data/models/role.dart';
import 'package:e_books/data/models/shelf.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'book.dart';
import 'quote.dart';
import 'review.dart';

part '../../domain/models/user/user.freezed.dart';
part '../../domain/models/user/user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String surname,
    required String name,
    required String? patronymic,
    required String username,
    required String email,
    required String? token,
    required double wallet,
    required Role? role,
    required List<Book>? bookmarks,
    required List<User>? followers,
    required List<User>? subscriptions,
    required List<Shelf>? shelves,
    required List<Quote>? quotes,
    required List<Review>? reviews,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  String getFullName() {
    return '$surname $name $patronymic';
  }

  String getInitials(){
    return '${surname[0].toUpperCase()} ${name[0].toUpperCase()}';
  }
}
