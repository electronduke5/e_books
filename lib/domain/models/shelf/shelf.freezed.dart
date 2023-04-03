// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../data/models/shelf.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Shelf _$ShelfFromJson(Map<String, dynamic> json) {
  return _Shelf.fromJson(json);
}

/// @nodoc
mixin _$Shelf {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  User get owner => throw _privateConstructorUsedError;
  List<Book>? get books => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShelfCopyWith<Shelf> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShelfCopyWith<$Res> {
  factory $ShelfCopyWith(Shelf value, $Res Function(Shelf) then) =
      _$ShelfCopyWithImpl<$Res, Shelf>;
  @useResult
  $Res call({int id, String title, User owner, List<Book>? books});

  $UserCopyWith<$Res> get owner;
}

/// @nodoc
class _$ShelfCopyWithImpl<$Res, $Val extends Shelf>
    implements $ShelfCopyWith<$Res> {
  _$ShelfCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? owner = null,
    Object? books = freezed,
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
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User,
      books: freezed == books
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get owner {
    return $UserCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ShelfCopyWith<$Res> implements $ShelfCopyWith<$Res> {
  factory _$$_ShelfCopyWith(_$_Shelf value, $Res Function(_$_Shelf) then) =
      __$$_ShelfCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, User owner, List<Book>? books});

  @override
  $UserCopyWith<$Res> get owner;
}

/// @nodoc
class __$$_ShelfCopyWithImpl<$Res> extends _$ShelfCopyWithImpl<$Res, _$_Shelf>
    implements _$$_ShelfCopyWith<$Res> {
  __$$_ShelfCopyWithImpl(_$_Shelf _value, $Res Function(_$_Shelf) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? owner = null,
    Object? books = freezed,
  }) {
    return _then(_$_Shelf(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User,
      books: freezed == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Shelf implements _Shelf {
  const _$_Shelf(
      {required this.id,
      required this.title,
      required this.owner,
      required final List<Book>? books})
      : _books = books;

  factory _$_Shelf.fromJson(Map<String, dynamic> json) =>
      _$$_ShelfFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final User owner;
  final List<Book>? _books;
  @override
  List<Book>? get books {
    final value = _books;
    if (value == null) return null;
    if (_books is EqualUnmodifiableListView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Shelf(id: $id, title: $title, owner: $owner, books: $books)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Shelf &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            const DeepCollectionEquality().equals(other._books, _books));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, owner,
      const DeepCollectionEquality().hash(_books));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShelfCopyWith<_$_Shelf> get copyWith =>
      __$$_ShelfCopyWithImpl<_$_Shelf>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShelfToJson(
      this,
    );
  }
}

abstract class _Shelf implements Shelf {
  const factory _Shelf(
      {required final int id,
      required final String title,
      required final User owner,
      required final List<Book>? books}) = _$_Shelf;

  factory _Shelf.fromJson(Map<String, dynamic> json) = _$_Shelf.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  User get owner;
  @override
  List<Book>? get books;
  @override
  @JsonKey(ignore: true)
  _$$_ShelfCopyWith<_$_Shelf> get copyWith =>
      throw _privateConstructorUsedError;
}
