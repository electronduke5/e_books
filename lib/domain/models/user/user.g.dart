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
      wallet: (json['wallet'] as num).toDouble(),
      role: json['role'] == null
          ? null
          : Role.fromJson(json['role'] as Map<String, dynamic>),
      bookmarks: (json['bookmarks'] as List<dynamic>?)
          ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
      followers: (json['followers'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      subscriptions: (json['subscriptions'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
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
      purchasedBooks: (json['purchasedBooks'] as List<dynamic>?)
          ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdBooks: (json['createdBooks'] as List<dynamic>?)
          ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
      posts: (json['posts'] as List<dynamic>?)
          ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
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
      'wallet': instance.wallet,
      'role': instance.role,
      'bookmarks': instance.bookmarks,
      'followers': instance.followers,
      'subscriptions': instance.subscriptions,
      'shelves': instance.shelves,
      'quotes': instance.quotes,
      'reviews': instance.reviews,
      'purchasedBooks': instance.purchasedBooks,
      'createdBooks': instance.createdBooks,
      'posts': instance.posts,
    };
