// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenImageResponse _$TokenImageResponseFromJson(Map<String, dynamic> json) =>
    TokenImageResponse(
      thumb: json['thumb'] as String,
      small: json['small'] as String,
      large: json['large'] as String,
    );

Map<String, dynamic> _$TokenImageResponseToJson(TokenImageResponse instance) =>
    <String, dynamic>{
      'thumb': instance.thumb,
      'small': instance.small,
      'large': instance.large,
    };
