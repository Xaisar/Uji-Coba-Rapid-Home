import 'package:json_annotation/json_annotation.dart';

import '../../authentication/model/response_status_model.dart';

part "register_response_model.g.dart";

@JsonSerializable()
class RegisterResponse{
  StatusResponse? statusResponse;
  Errors? error;

  RegisterResponse({
    this.statusResponse,
    this.error
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson()=>_$RegisterResponseToJson(this);
}

@JsonSerializable()
class Errors{
  String? name;
  String? email;
  String? password;
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
