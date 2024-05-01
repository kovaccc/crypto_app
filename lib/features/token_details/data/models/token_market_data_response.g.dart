// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_market_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenMarketDataResponse _$TokenMarketDataResponseFromJson(
        Map<String, dynamic> json) =>
    TokenMarketDataResponse(
      currentPrice: TokenCurrentPriceResponse.fromJson(
          json['current_price'] as Map<String, dynamic>),
      priceChangePercentage24h:
          (json['price_change_percentage_24h'] as num).toDouble(),
      sparkline7d: TokenSparklineResponse.fromJson(
          json['sparkline_7d'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TokenMarketDataResponseToJson(
        TokenMarketDataResponse instance) =>
    <String, dynamic>{
      'current_price': instance.currentPrice,
      'price_change_percentage_24h': instance.priceChangePercentage24h,
      'sparkline_7d': instance.sparkline7d,
    };
