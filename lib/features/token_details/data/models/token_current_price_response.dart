import 'package:json_annotation/json_annotation.dart';

part 'token_current_price_response.g.dart';

@JsonSerializable()
class TokenCurrentPriceResponse {
  final double usd;

  TokenCurrentPriceResponse({required this.usd});

  factory TokenCurrentPriceResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenCurrentPriceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenCurrentPriceResponseToJson(this);
}
