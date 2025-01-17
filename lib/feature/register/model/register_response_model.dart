import 'package:json_annotation/json_annotation.dart';

import '../../authentication/model/response_status_model.dart';

// part "register_response_model.g.dart";

// @JsonSerializable()
class RegisterResponse{
  @JsonKey(name: 'respon_status')
  StatusResponse? statusResponse;
  @JsonKey(name: 'errors')
  Errors? error;

  RegisterResponse({
    this.statusResponse,
    this.error
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson()=>_$RegisterResponseToJson(this);
}

// @JsonSerializable()
class Errors{
  String? name;
  String? email;
  String? password;
  @JsonKey(name: 'password_confirm')
  String? confirmPassword;

  Errors({
    this.name,
    this.email,
    this.password,
    this.confirmPassword
  });

  factory Errors.fromJson(Map<String, dynamic> json) => _$ErrorsFromJson(json);

  Map<String, dynamic> toJson()=>_$ErrorsToJson(this);
} 

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      statusResponse: json['respon_status'] == null
          ? null
          : StatusResponse.fromJson(
              json['respon_status'] as Map<String, dynamic>),
      error: json['errors'] == null || json['errors'].length == 0
          ? null
          : Errors.fromJson(json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'respon_status': instance.statusResponse,
      'errors': instance.error,
    };

Errors _$ErrorsFromJson(Map<String, dynamic> json) => Errors(
      name: json['name'] == null
      ? null
      : json['name'][0] as String?,
      email: json['email'] == null
      ? null
      : json['email'][0] as String?,
      password: json['password'] == null
      ? null
      : json['password'][0] as String?,
      confirmPassword: json['password_confirm'] == null
      ? null
      : json['password_confirm'][0] as String?,
    );

Map<String, dynamic> _$ErrorsToJson(Errors instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'password_confirm': instance.confirmPassword,
    };