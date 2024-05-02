import 'package:json_annotation/json_annotation.dart';

part 'token_sparkline_response.g.dart';

@JsonSerializable()
class TokenSparklineResponse {
  @JsonKey(name: 'price')
  final List<double> prices;

  TokenSparklineResponse({
    required this.prices,
  });

  factory TokenSparklineResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenSparklineResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenSparklineResponseToJson(this);
}
