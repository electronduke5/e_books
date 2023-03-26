// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../data/models/author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Author _$$_AuthorFromJson(Map<String, dynamic> json) => _$_Author(
      id: json['id'] as int,
      surname: json['surname'] as String,
      name: json['name'] as String,
      patronymic: json['patronymic'] as String,
      information: json['information'] as String,
      books: (json['books'] as List<dynamic>?)
          ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AuthorToJson(_$_Author instance) => <String, dynamic>{
      'id': instance.id,
      'surname': instance.surname,
      'name': instance.name,
      'patronymic': instance.patronymic,
      'information': instance.information,
      'books': instance.books,
    };
