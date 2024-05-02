import 'package:crypto_app/features/token_details/data/models/token_description_response.dart';
import 'package:crypto_app/features/token_details/data/models/token_image_response.dart';
import 'package:crypto_app/features/token_details/data/models/token_market_data_response.dart';
import 'package:crypto_app/features/token_details/data/models/token_sparkline_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_details_response.g.dart';

@JsonSerializable()
class TokenDetailsResponse {
  final String id;
  final String symbol;
  final String name;
  final TokenImageResponse image;

  @JsonKey(name: 'market_data')
  final TokenMarketDataResponse marketData;

  @JsonKey(name: 'market_cap_rank')
  final int marketCapRank;

  final TokenDescriptionResponse description;

  TokenDetailsResponse({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.marketData,
    required this.marketCapRank,
    required this.description,
  });

  factory TokenDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenDetailsResponseToJson(this);
}
