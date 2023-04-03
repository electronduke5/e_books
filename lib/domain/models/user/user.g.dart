// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../data/models/user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      surname: json['surname'] as String,
      name: json['name'] as String,
      patronymic: json['patronymic'] as String?,
      username: json['username'] as String,
      email: json['email'] as String,
      token: json['token'] as String?,
      bookmarks: (json['bookmarks'] as List<dynamic>?)
          ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
      shelves: (json['shelves'] as List<dynamic>?)
          ?.map((e) => Shelf.fromJson(e as Map<String, dynamic>))
          .toList(),
      quotes: (json['quotes'] as List<dynamic>?)
          ?.map((e) => Quote.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'surname': instance.surname,
      'name': instance.name,
      'patronymic': instance.patronymic,
      'username': instance.username,
      'email': instance.email,
      'token': instance.token,
      'bookmarks': instance.bookmarks,
      'shelves': instance.shelves,
      'quotes': instance.quotes,
      'reviews': instance.reviews,
    };
