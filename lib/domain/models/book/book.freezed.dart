// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../data/models/book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Book _$BookFromJson(Map<String, dynamic> json) {
  return _Book.fromJson(json);
}

/// @nodoc
mixin _$Book {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get yearOfIssue => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get file => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  List<Author>? get authors => throw _privateConstructorUsedError;
  List<Review>? get reviews => throw _privateConstructorUsedError;
  User? get creator => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res, Book>;
  @useResult
  $Res call(
      {int id,
      String title,
      String yearOfIssue,
      String? image,
      String? file,
      double? rating,
      double? price,
      List<Author>? authors,
      List<Review>? reviews,
      User? creator});

  $UserCopyWith<$Res>? get creator;
}

/// @nodoc
class _$BookCopyWithImpl<$Res, $Val extends Book>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? yearOfIssue = null,
    Object? image = freezed,
    Object? file = freezed,
    Object? rating = freezed,
    Object? price = freezed,
    Object? authors = freezed,
    Object? reviews = freezed,
    Object? creator = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      yearOfIssue: null == yearOfIssue
          ? _value.yearOfIssue
          : yearOfIssue // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      authors: freezed == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<Author>?,
      reviews: freezed == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>?,
      creator: freezed == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get creator {
    if (_value.creator == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.creator!, (value) {
      return _then(_value.copyWith(creator: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$$_BookCopyWith(_$_Book value, $Res Function(_$_Book) then) =
      __$$_BookCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String yearOfIssue,
      String? image,
      String? file,
      double? rating,
      double? price,
      List<Author>? authors,
      List<Review>? reviews,
      User? creator});

  @override
  $UserCopyWith<$Res>? get creator;
}

/// @nodoc
class __$$_BookCopyWithImpl<$Res> extends _$BookCopyWithImpl<$Res, _$_Book>
    implements _$$_BookCopyWith<$Res> {
  __$$_BookCopyWithImpl(_$_Book _value, $Res Function(_$_Book) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? yearOfIssue = null,
    Object? image = freezed,
    Object? file = freezed,
    Object? rating = freezed,
    Object? price = freezed,
    Object? authors = freezed,
    Object? reviews = freezed,
    Object? creator = freezed,
  }) {
    return _then(_$_Book(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      yearOfIssue: null == yearOfIssue
          ? _value.yearOfIssue
          : yearOfIssue // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      authors: freezed == authors
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<Author>?,
      reviews: freezed == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>?,
      creator: freezed == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Book implements _Book {
  const _$_Book(
      {required this.id,
      required this.title,
      required this.yearOfIssue,
      this.image,
      this.file,
      this.rating,
      this.price,
      final List<Author>? authors,
      final List<Review>? reviews,
      this.creator})
      : _authors = authors,
        _reviews = reviews;

  factory _$_Book.fromJson(Map<String, dynamic> json) => _$$_BookFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String yearOfIssue;
  @override
  final String? image;
  @override
  final String? file;
  @override
  final double? rating;
  @override
  final double? price;
  final List<Author>? _authors;
  @override
  List<Author>? get authors {
    final value = _authors;
    if (value == null) return null;
    if (_authors is EqualUnmodifiableListView) return _authors;
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

  @override
  final User? creator;

  @override
  String toString() {
    return 'Book(id: $id, title: $title, yearOfIssue: $yearOfIssue, image: $image, file: $file, rating: $rating, price: $price, authors: $authors, reviews: $reviews, creator: $creator)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Book &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.yearOfIssue, yearOfIssue) ||
                other.yearOfIssue == yearOfIssue) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality().equals(other._authors, _authors) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.creator, creator) || other.creator == creator));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      yearOfIssue,
      image,
      file,
      rating,
      price,
      const DeepCollectionEquality().hash(_authors),
      const DeepCollectionEquality().hash(_reviews),
      creator);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookCopyWith<_$_Book> get copyWith =>
      __$$_BookCopyWithImpl<_$_Book>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookToJson(
      this,
    );
  }
}

abstract class _Book implements Book {
  const factory _Book(
      {required final int id,
      required final String title,
      required final String yearOfIssue,
      final String? image,
      final String? file,
      final double? rating,
      final double? price,
      final List<Author>? authors,
      final List<Review>? reviews,
      final User? creator}) = _$_Book;

  factory _Book.fromJson(Map<String, dynamic> json) = _$_Book.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get yearOfIssue;
  @override
  String? get image;
  @override
  String? get file;
  @override
  double? get rating;
  @override
  double? get price;
  @override
  List<Author>? get authors;
  @override
  List<Review>? get reviews;
  @override
  User? get creator;
  @override
  @JsonKey(ignore: true)
  _$$_BookCopyWith<_$_Book> get copyWith => throw _privateConstructorUsedError;
}
