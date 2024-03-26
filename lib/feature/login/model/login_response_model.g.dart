// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      statusResponse: json['respon_status'] == null
          ? null
          : StatusResponse.fromJson(
              json['respon_status'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      errors: json['errors'] == null || json['errors'].length == 0
          ? null
          : Errors.fromJson(json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'respon_status': instance.statusResponse,
      'data': instance.data,
      'errors': instance.errors,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      sessionToken: json['token'] == null
          ? null
          : SessionToken.fromJson(json['token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'sessionToken': instance.sessionToken,
    };

Errors _$ErrorsFromJson(Map<String, dynamic> json) => Errors(
      email: json['identify'] == null
      ? null
      : json['identify'][0] as String?,
      password: json['password'] == null
      ? null
      : json['password'][0] as String?,
    );

Map<String, dynamic> _$ErrorsToJson(Errors instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
