// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_token_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidateTokenResponse _$ValidateTokenResponseFromJson(
        Map<String, dynamic> json) =>
    ValidateTokenResponse(
      statusResponse: json['respon_status'] == null
          ? null
          : StatusResponse.fromJson(
              json['respon_status'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ValidateTokenResponseToJson(
        ValidateTokenResponse instance) =>
    <String, dynamic>{
      'respon_status': instance.statusResponse,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      sessionToken: json['token'] == null
          ? null
          : SessionToken.fromJson(json['token'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'token': instance.sessionToken,
      'user': instance.user,
    };
