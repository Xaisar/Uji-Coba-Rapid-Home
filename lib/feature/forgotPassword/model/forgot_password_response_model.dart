import 'package:json_annotation/json_annotation.dart';

import '../../authentication/model/response_status_model.dart';

// part'forgot_password_response_model.g.dart';

// @JsonSerializable()
class ForgotPasswordResponse {
  @JsonKey(name: 'respon_status')
  StatusResponse? statusResponse;
  @JsonKey(name: "errors")
  Errors? errors;

  ForgotPasswordResponse({
    this.statusResponse,
    this.errors
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) => _$ForgotPasswordResponseFromJson(json);

  Map<String, dynamic> toJson()=>_$ForgotPasswordResponseToJson(this);
}

// @JsonSerializable()
class Errors{
  String? email;

  Errors({
    this.email
  });

  factory Errors.fromJson(Map<String, dynamic> json) => _$ErrorsFromJson(json);

  Map<String, dynamic> toJson()=>_$ErrorsToJson(this);
}

ForgotPasswordResponse _$ForgotPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ForgotPasswordResponse(
      statusResponse: json['respon_status'] == null
          ? null
          : StatusResponse.fromJson(
              json['respon_status'] as Map<String, dynamic>),
      errors: json['errors'] == null
          ? null
          : Errors.fromJson(json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForgotPasswordResponseToJson(
        ForgotPasswordResponse instance) =>
    <String, dynamic>{
      'respon_status': instance.statusResponse,
      'errors': instance.errors,
    };

Errors _$ErrorsFromJson(Map<String, dynamic> json) => Errors(
      email: json['email'][0] as String?,
    );

Map<String, dynamic> _$ErrorsToJson(Errors instance) => <String, dynamic>{
      'email': instance.email,
    };