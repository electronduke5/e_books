// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../data/models/shelf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Shelf _$$_ShelfFromJson(Map<String, dynamic> json) => _$_Shelf(
      id: json['id'] as int,
      title: json['title'] as String,
      owner: User.fromJson(json['owner'] as Map<String, dynamic>),
      books: (json['books'] as List<dynamic>?)
          ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ShelfToJson(_$_Shelf instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'owner': instance.owner,
      'books': instance.books,
    };
