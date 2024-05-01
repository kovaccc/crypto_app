import 'package:json_annotation/json_annotation.dart';

part 'token_image_response.g.dart';

@JsonSerializable()
class TokenImageResponse {
  final String thumb;
  final String small;
  final String large;

  TokenImageResponse({
    required this.thumb,
    required this.small,
    required this.large,
  });

  factory TokenImageResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenImageResponseToJson(this);
}
