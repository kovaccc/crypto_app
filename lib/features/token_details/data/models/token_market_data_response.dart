import 'package:crypto_app/features/token_details/data/models/token_current_price_response.dart';
import 'package:crypto_app/features/token_details/data/models/token_sparkline_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_market_data_response.g.dart';

@JsonSerializable()
class TokenMarketDataResponse {
  @JsonKey(name: 'current_price')
  final TokenCurrentPriceResponse currentPrice;

  @JsonKey(name: 'price_change_percentage_24h')
  final double priceChangePercentage24h;

  @JsonKey(name: 'sparkline_7d')
  final TokenSparklineResponse sparkline7d;

  TokenMarketDataResponse({
    required this.currentPrice,
    required this.priceChangePercentage24h,
    required this.sparkline7d,
  });

  factory TokenMarketDataResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenMarketDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenMarketDataResponseToJson(this);
}
