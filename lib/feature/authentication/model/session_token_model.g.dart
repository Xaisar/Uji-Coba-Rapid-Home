// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionToken _$SessionTokenFromJson(Map<String, dynamic> json) => SessionToken(
      accesToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
      expiredDate: DateTime.parse(json['expires_in'] as String),
    );

Map<String, dynamic> _$SessionTokenToJson(SessionToken instance) =>
    <String, dynamic>{
      'access_token': instance.accesToken,
      'token_type': instance.tokenType,
      'expires_in': instance.expiredDate.toIso8601String(),
    };
