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
      price: (json['price'] as num?)?.toDouble(),
      authors: (json['authors'] as List<dynamic>?)
          ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      creator: json['creator'] == null
          ? null
          : User.fromJson(json['creator'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BookToJson(_$_Book instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'yearOfIssue': instance.yearOfIssue,
      'image': instance.image,
      'file': instance.file,
      'rating': instance.rating,
      'price': instance.price,
      'authors': instance.authors,
      'reviews': instance.reviews,
      'creator': instance.creator,
    };
