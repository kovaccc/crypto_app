import 'package:json_annotation/json_annotation.dart';

part 'token_description_response.g.dart';

@JsonSerializable()
class TokenDescriptionResponse {
  @JsonKey(name: 'en')
  final String enText;

  TokenDescriptionResponse({
    required this.enText,
  });

  factory TokenDescriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenDescriptionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenDescriptionResponseToJson(this);
}
