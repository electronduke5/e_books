// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../data/models/post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      id: json['id'] as int,
      description: json['description'] as String,
      image: json['image'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      dateCreated: json['dateCreated'] == null
          ? null
          : DateTime.parse(json['dateCreated'] as String),
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'image': instance.image,
      'user': instance.user,
      'dateCreated': instance.dateCreated?.toIso8601String(),
    };
