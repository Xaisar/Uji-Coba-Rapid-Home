// import 'package:json_annotation/json_annotation.dart';

import '../../../feature/authentication/model/response_status_model.dart';
import '../../../feature/authentication/model/session_token_model.dart';

part 'login_response_model.g.dart';

// @JsonSerializable()
class LoginResponse{
  StatusResponse? statusResponse;
  Data? data;
  
  LoginResponse({
    this.statusResponse,
    this.data
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson()=>_$LoginResponseToJson(this);
}

// @JsonSerializable()
class Data{
  SessionToken? sessionToken;

  Data({
    this.sessionToken
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
  
}

