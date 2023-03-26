// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../data/models/quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Quote _$$_QuoteFromJson(Map<String, dynamic> json) => _$_Quote(
      id: json['id'] as int,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      text: json['text'] as String,
    );

Map<String, dynamic> _$$_QuoteToJson(_$_Quote instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'text': instance.text,
    };
