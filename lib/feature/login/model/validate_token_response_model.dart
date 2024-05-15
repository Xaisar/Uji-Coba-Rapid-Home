import 'package:json_annotation/json_annotation.dart';

import '../../authentication/model/response_status_model.dart';
import '../../authentication/model/session_token_model.dart';
import '../../authentication/model/user_validate_model.dart';

// part 'validate_token_response_model.g.dart';

// @JsonSerializable()
class ValidateTokenResponse{
  @JsonKey(name: 'respon_status')
  StatusResponse? statusResponse;
  Data? data;
  
  ValidateTokenResponse({
    this.statusResponse,
    this.data
  });

  factory ValidateTokenResponse.fromJson(Map<String, dynamic> json) => _$ValidateTokenResponseFromJson(json);

  Map<String, dynamic> toJson()=>_$ValidateTokenResponseToJson(this);
}

// @JsonSerializable()
class Data{
  @JsonKey(name: 'token')
  SessionToken? sessionToken;
  UserValidate? user;

  Data({
    this.sessionToken,
    this.user
  }); 

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this); 
}

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
          : UserValidate.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'token': instance.sessionToken,
      'user': instance.user,
    };
