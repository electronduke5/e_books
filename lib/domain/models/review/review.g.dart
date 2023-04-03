// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../data/models/review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Review _$$_ReviewFromJson(Map<String, dynamic> json) => _$_Review(
      id: json['id'] as int,
      description: json['description'] as String,
      author: User.fromJson(json['author'] as Map<String, dynamic>),
      book: Book.fromJson(json['book'] as Map<String, dynamic>),
      rating: json['rating'] as int,
      dateCreated: DateTime.parse(json['dateCreated'] as String),
    );

Map<String, dynamic> _$$_ReviewToJson(_$_Review instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'author': instance.author,
      'book': instance.book,
      'rating': instance.rating,
      'dateCreated': instance.dateCreated.toIso8601String(),
    };
