import 'package:e_books/data/models/book.dart';

import '../../data/models/quote.dart';
import '../../data/models/review.dart';
import '../../data/models/role.dart';
import '../../data/models/shelf.dart';
import '../../data/models/user.dart';

class ProfileHolder {
  User user = const User(
    id: 0,
    name: '',
    surname: '',
    email: '',
    token: '',
    username: '',
    bookmarks: <Book>[],
    patronymic: '',
    quotes: <Quote>[],
    reviews: <Review>[],
    shelves: <Shelf>[],
    wallet: 0.0,
    role: Role(id: 1, roleName: 'Читатель'),
    followers: <User>[],
    subscriptions: <User>[],
  );
}
