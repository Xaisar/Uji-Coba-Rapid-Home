import 'package:json_annotation/json_annotation.dart';

import '../../authentication/model/response_status_model.dart';
import '../../authentication/model/session_token_model.dart';
import '../../authentication/model/user_model.dart';

part 'validate_token_response_model.g.dart';

@JsonSerializable()
class ValidateTokenResponse{
  StatusResponse? statusResponse;
  Data? data;
  
  ValidateTokenResponse({
    this.statusResponse,
    this.data
  });

  factory ValidateTokenResponse.fromJson(Map<String, dynamic> json) => _$ValidateTokenResponseFromJson(json);

  Map<String, dynamic> toJson()=>_$ValidateTokenResponseToJson(this);
}

@JsonSerializable()
class Data{
  SessionToken? sessionToken;
  User? user;

  Data({
    this.sessionToken,
    this.user
  }); 

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this); 
}