import 'package:freezed_annotation/freezed_annotation.dart';

import 'user.dart';

part '../../domain/models/quote/quote.freezed.dart';
part '../../domain/models/quote/quote.g.dart';

@freezed
class Quote with _$Quote {
  const factory Quote({
    required int id,
    required User user,
    required String text,
  }) = _Quote;

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);
}
