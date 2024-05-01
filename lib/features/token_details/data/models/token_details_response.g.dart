// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenDetailsResponse _$TokenDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    TokenDetailsResponse(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      image: TokenImageResponse.fromJson(json['image'] as Map<String, dynamic>),
      marketData: TokenMarketDataResponse.fromJson(
          json['market_data'] as Map<String, dynamic>),
      marketCapRank: (json['market_cap_rank'] as num).toInt(),
      description: TokenDescriptionResponse.fromJson(
          json['description'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TokenDetailsResponseToJson(
        TokenDetailsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'market_data': instance.marketData,
      'market_cap_rank': instance.marketCapRank,
      'description': instance.description,
    };
