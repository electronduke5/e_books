// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../data/models/user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String get surname => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get patronymic => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  double get wallet => throw _privateConstructorUsedError;
  Role? get role => throw _privateConstructorUsedError;
  List<Book>? get bookmarks => throw _privateConstructorUsedError;
  List<User>? get followers => throw _privateConstructorUsedError;
  List<User>? get subscriptions => throw _privateConstructorUsedError;
  List<Shelf>? get shelves => throw _privateConstructorUsedError;
  List<Quote>? get quotes => throw _privateConstructorUsedError;
  List<Review>? get reviews => throw _privateConstructorUsedError;
  List<Book>? get purchasedBooks => throw _privateConstructorUsedError;
  List<Book>? get createdBooks => throw _privateConstructorUsedError;
  List<Post>? get posts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int id,
      String surname,
      String name,
      String? patronymic,
      String username,
      String email,
      String? token,
      double wallet,
      Role? role,
      List<Book>? bookmarks,
      List<User>? followers,
      List<User>? subscriptions,
      List<Shelf>? shelves,
      List<Quote>? quotes,
      List<Review>? reviews,
      List<Book>? purchasedBooks,
      List<Book>? createdBooks,
      List<Post>? posts});

  $RoleCopyWith<$Res>? get role;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? surname = null,
    Object? name = null,
    Object? patronymic = freezed,
    Object? username = null,
    Object? email = null,
    Object? token = freezed,
    Object? wallet = null,
    Object? role = freezed,
    Object? bookmarks = freezed,
    Object? followers = freezed,
    Object? subscriptions = freezed,
    Object? shelves = freezed,
    Object? quotes = freezed,
    Object? reviews = freezed,
    Object? purchasedBooks = freezed,
    Object? createdBooks = freezed,
    Object? posts = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      surname: null == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      patronymic: freezed == patronymic
          ? _value.patronymic
          : patronymic // ignore: cast_nullable_to_non_nullable
              as String?,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as double,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role?,
      bookmarks: freezed == bookmarks
          ? _value.bookmarks
          : bookmarks // ignore: cast_nullable_to_non_nullable
              as List<Book>?,
      followers: freezed == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      subscriptions: freezed == subscriptions
          ? _value.subscriptions
          : subscriptions // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      shelves: freezed == shelves
          ? _value.shelves
          : shelves // ignore: cast_nullable_to_non_nullable
              as List<Shelf>?,
      quotes: freezed == quotes
          ? _value.quotes
          : quotes // ignore: cast_nullable_to_non_nullable
              as List<Quote>?,
      reviews: freezed == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>?,
      purchasedBooks: freezed == purchasedBooks
          ? _value.purchasedBooks
          : purchasedBooks // ignore: cast_nullable_to_non_nullable
              as List<Book>?,
      createdBooks: freezed == createdBooks
          ? _value.createdBooks
          : createdBooks // ignore: cast_nullable_to_non_nullable
              as List<Book>?,
      posts: freezed == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RoleCopyWith<$Res>? get role {
    if (_value.role == null) {
      return null;
    }

    return $RoleCopyWith<$Res>(_value.role!, (value) {
      return _then(_value.copyWith(role: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String surname,
      String name,
      String? patronymic,
      String username,
      String email,
      String? token,
      double wallet,
      Role? role,
      List<Book>? bookmarks,
      List<User>? followers,
      List<User>? subscriptions,
      List<Shelf>? shelves,
      List<Quote>? quotes,
      List<Review>? reviews,
      List<Book>? purchasedBooks,
      List<Book>? createdBooks,
      List<Post>? posts});

  @override
  $RoleCopyWith<$Res>? get role;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? surname = null,
    Object? name = null,
    Object? patronymic = freezed,
    Object? username = null,
    Object? email = null,
    Object? token = freezed,
    Object? wallet = null,
    Object? role = freezed,
    Object? bookmarks = freezed,
    Object? followers = freezed,
    Object? subscriptions = freezed,
    Object? shelves = freezed,
    Object? quotes = freezed,
    Object? reviews = freezed,
    Object? purchasedBooks = freezed,
    Object? createdBooks = freezed,
    Object? posts = freezed,
  }) {
    return _then(_$_User(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      surname: null == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      patronymic: freezed == patronymic
          ? _value.patronymic
          : patronymic // ignore: cast_nullable_to_non_nullable
              as String?,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as double,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role?,
      bookmarks: freezed == bookmarks
          ? _value._bookmarks
          : bookmarks // ignore: cast_nullable_to_non_nullable
              as List<Book>?,
      followers: freezed == followers
          ? _value._followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      subscriptions: freezed == subscriptions
          ? _value._subscriptions
          : subscriptions // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      shelves: freezed == shelves
          ? _value._shelves
          : shelves // ignore: cast_nullable_to_non_nullable
              as List<Shelf>?,
      quotes: freezed == quotes
          ? _value._quotes
          : quotes // ignore: cast_nullable_to_non_nullable
              as List<Quote>?,
      reviews: freezed == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>?,
      purchasedBooks: freezed == purchasedBooks
          ? _value._purchasedBooks
          : purchasedBooks // ignore: cast_nullable_to_non_nullable
              as List<Book>?,
      createdBooks: freezed == createdBooks
          ? _value._createdBooks
          : createdBooks // ignore: cast_nullable_to_non_nullable
              as List<Book>?,
      posts: freezed == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {required this.id,
      required this.surname,
      required this.name,
      required this.patronymic,
      required this.username,
      required this.email,
      required this.token,
      required this.wallet,
      required this.role,
      required final List<Book>? bookmarks,
      required final List<User>? followers,
      required final List<User>? subscriptions,
      required final List<Shelf>? shelves,
      required final List<Quote>? quotes,
      required final List<Review>? reviews,
      required final List<Book>? purchasedBooks,
      required final List<Book>? createdBooks,
      required final List<Post>? posts})
      : _bookmarks = bookmarks,
        _followers = followers,
        _subscriptions = subscriptions,
        _shelves = shelves,
        _quotes = quotes,
        _reviews = reviews,
        _purchasedBooks = purchasedBooks,
        _createdBooks = createdBooks,
        _posts = posts;

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final int id;
  @override
  final String surname;
  @override
  final String name;
  @override
  final String? patronymic;
  @override
  final String username;
  @override
  final String email;
  @override
  final String? token;
  @override
  final double wallet;
  @override
  final Role? role;
  final List<Book>? _bookmarks;
  @override
  List<Book>? get bookmarks {
    final value = _bookmarks;
    if (value == null) return null;
    if (_bookmarks is EqualUnmodifiableListView) return _bookmarks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<User>? _followers;
  @override
  List<User>? get followers {
    final value = _followers;
    if (value == null) return null;
    if (_followers is EqualUnmodifiableListView) return _followers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<User>? _subscriptions;
  @override
  List<User>? get subscriptions {
    final value = _subscriptions;
    if (value == null) return null;
    if (_subscriptions is EqualUnmodifiableListView) return _subscriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Shelf>? _shelves;
  @override
  List<Shelf>? get shelves {
    final value = _shelves;
    if (value == null) return null;
    if (_shelves is EqualUnmodifiableListView) return _shelves;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Quote>? _quotes;
  @override
  List<Quote>? get quotes {
    final value = _quotes;
    if (value == null) return null;
    if (_quotes is EqualUnmodifiableListView) return _quotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Review>? _reviews;
  @override
  List<Review>? get reviews {
    final value = _reviews;
    if (value == null) return null;
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Book>? _purchasedBooks;
  @override
  List<Book>? get purchasedBooks {
    final value = _purchasedBooks;
    if (value == null) return null;
    if (_purchasedBooks is EqualUnmodifiableListView) return _purchasedBooks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Book>? _createdBooks;
  @override
  List<Book>? get createdBooks {
    final value = _createdBooks;
    if (value == null) return null;
    if (_createdBooks is EqualUnmodifiableListView) return _createdBooks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Post>? _posts;
  @override
  List<Post>? get posts {
    final value = _posts;
    if (value == null) return null;
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'User(id: $id, surname: $surname, name: $name, patronymic: $patronymic, username: $username, email: $email, token: $token, wallet: $wallet, role: $role, bookmarks: $bookmarks, followers: $followers, subscriptions: $subscriptions, shelves: $shelves, quotes: $quotes, reviews: $reviews, purchasedBooks: $purchasedBooks, createdBooks: $createdBooks, posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.surname, surname) || other.surname == surname) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.patronymic, patronymic) ||
                other.patronymic == patronymic) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality()
                .equals(other._bookmarks, _bookmarks) &&
            const DeepCollectionEquality()
                .equals(other._followers, _followers) &&
            const DeepCollectionEquality()
                .equals(other._subscriptions, _subscriptions) &&
            const DeepCollectionEquality().equals(other._shelves, _shelves) &&
            const DeepCollectionEquality().equals(other._quotes, _quotes) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            const DeepCollectionEquality()
                .equals(other._purchasedBooks, _purchasedBooks) &&
            const DeepCollectionEquality()
                .equals(other._createdBooks, _createdBooks) &&
            const DeepCollectionEquality().equals(other._posts, _posts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      surname,
      name,
      patronymic,
      username,
      email,
      token,
      wallet,
      role,
      const DeepCollectionEquality().hash(_bookmarks),
      const DeepCollectionEquality().hash(_followers),
      const DeepCollectionEquality().hash(_subscriptions),
      const DeepCollectionEquality().hash(_shelves),
      const DeepCollectionEquality().hash(_quotes),
      const DeepCollectionEquality().hash(_reviews),
      const DeepCollectionEquality().hash(_purchasedBooks),
      const DeepCollectionEquality().hash(_createdBooks),
      const DeepCollectionEquality().hash(_posts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }

  @override
  String getFullName() {
    return '$surname $name $patronymic';
  }

  @override
  String getInitials() {
    return '${surname[0].toUpperCase()} ${name[0].toUpperCase()}';
  }
}

abstract class _User implements User {
  const factory _User(
      {required final int id,
      required final String surname,
      required final String name,
      required final String? patronymic,
      required final String username,
      required final String email,
      required final String? token,
      required final double wallet,
      required final Role? role,
      required final List<Book>? bookmarks,
      required final List<User>? followers,
      required final List<User>? subscriptions,
      required final List<Shelf>? shelves,
      required final List<Quote>? quotes,
      required final List<Review>? reviews,
      required final List<Book>? purchasedBooks,
      required final List<Book>? createdBooks,
      required final List<Post>? posts}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  int get id;
  @override
  String get surname;
  @override
  String get name;
  @override
  String? get patronymic;
  @override
  String get username;
  @override
  String get email;
  @override
  String? get token;
  @override
  double get wallet;
  @override
  Role? get role;
  @override
  List<Book>? get bookmarks;
  @override
  List<User>? get followers;
  @override
  List<User>? get subscriptions;
  @override
  List<Shelf>? get shelves;
  @override
  List<Quote>? get quotes;
  @override
  List<Review>? get reviews;
  @override
  List<Book>? get purchasedBooks;
  @override
  List<Book>? get createdBooks;
  @override
  List<Post>? get posts;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
