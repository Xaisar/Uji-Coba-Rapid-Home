import 'package:json_annotation/json_annotation.dart';

import '../../../feature/authentication/model/response_status_model.dart';
import '../../../feature/authentication/model/session_token_model.dart';

// part 'login_response_model.g.dart';

// @JsonSerializable()
class LoginResponse{
  @JsonKey(name: "respon_status")
  StatusResponse? statusResponse;
  Data? data;
  @JsonKey(name: "errors")
  Errors? errors;
  
  LoginResponse({
    this.statusResponse,
    this.data,
    this.errors
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson()=>_$LoginResponseToJson(this);
}

// @JsonSerializable()
class Data{
  @JsonKey(name: 'token')
  SessionToken? sessionToken;

  Data({
    this.sessionToken
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
  
}

// @JsonSerializable()
class Errors{
  @JsonKey(name: 'identify')
  String? email;
  String? password;


  Errors({
    this.email,
    this.password
  });

  factory Errors.fromJson(Map<String, dynamic> json) => _$ErrorsFromJson(json);

  Map<String, dynamic> toJson()=>_$ErrorsToJson(this);
} 

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
      'token': instance.sessionToken,
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
      'identify': instance.email,
      'password': instance.password,
    };
