// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../data/models/book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Book _$$_BookFromJson(Map<String, dynamic> json) => _$_Book(
      id: json['id'] as int,
      title: json['title'] as String,
      yearOfIssue: json['yearOfIssue'] as String,
      image: json['image'] as String?,
      file: json['file'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      authors: (json['authors'] as List<dynamic>?)
          ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BookToJson(_$_Book instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'yearOfIssue': instance.yearOfIssue,
      'image': instance.image,
      'file': instance.file,
      'rating': instance.rating,
      'authors': instance.authors,
    };