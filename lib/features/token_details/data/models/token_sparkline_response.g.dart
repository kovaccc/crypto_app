// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_sparkline_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenSparklineResponse _$TokenSparklineResponseFromJson(
        Map<String, dynamic> json) =>
    TokenSparklineResponse(
      prices: (json['price'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$TokenSparklineResponseToJson(
        TokenSparklineResponse instance) =>
    <String, dynamic>{
      'price': instance.prices,
    };
