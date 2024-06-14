import 'package:json_annotation/json_annotation.dart';
import '../../authentication/model/response_status_model.dart';

// part 'change_password_response_model.g.dart';

// @JsonSerializable()
class ChangePasswordResponse {
  @JsonKey(name: 'respon_status')
  StatusResponse? statusResponse;
  @JsonKey(name: 'errors')
  Errors? errors;

  ChangePasswordResponse ({
    this.statusResponse,
    this.errors
  });

  factory ChangePasswordResponse .fromJson(Map<String, dynamic> json) => _$ChangePasswordResponseFromJson(json);

  Map<String, dynamic> toJson()=>_$ChangePasswordResponseToJson(this);
}

// @JsonSerializable()
class Errors {
  String? password;
  @JsonKey(name: 'password_confirm')
  String? passswordConfirm;

  Errors({
    this.password,
    this.passswordConfirm
  });

   factory Errors.fromJson(Map<String, dynamic> json) => _$ErrorsFromJson(json);

  Map<String, dynamic> toJson()=>_$ErrorsToJson(this);
}

ChangePasswordResponse _$ChangePasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordResponse(
      statusResponse: json['respon_status'] == null
          ? null
          : StatusResponse.fromJson(
              json['respon_status'] as Map<String, dynamic>),
      errors: json['errors'] == null
          ? null
          : Errors.fromJson(json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChangePasswordResponseToJson(
        ChangePasswordResponse instance) =>
    <String, dynamic>{
      'respon_status': instance.statusResponse,
      'errors': instance.errors,
    };

Errors _$ErrorsFromJson(Map<String, dynamic> json) => Errors(
      password:json['password'] == null
      ? null
      : json['password'][0] as String?,
      passswordConfirm: json['password_confirm'] == null
      ? null
      : json['password_confirm'][0] as String?,
    );

Map<String, dynamic> _$ErrorsToJson(Errors instance) => <String, dynamic>{
      'password': instance.password,
      'password_confirm': instance.passswordConfirm,
    };
