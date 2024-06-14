import 'package:json_annotation/json_annotation.dart';
import '../../authentication/model/response_status_model.dart';

// part 'edit_profile_response_model.g.dart';

// @JsonSerializable()
class EditProfileResponse {
  @JsonKey(name: 'respon_status')
  StatusResponse? statusResponse;
  @JsonKey(name: 'errors')
  Errors? errors;

  EditProfileResponse({
    this.statusResponse,
    this.errors
  });

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) => _$EditProfileResponseFromJson(json);

  Map<String, dynamic> toJson()=>_$EditProfileResponseToJson(this);
}

// @JsonSerializable()
class Errors {
  String? name;
  String? email;
  String? avatar;

  Errors({
    this.email,
    this.name,
    this.avatar
  });

   factory Errors.fromJson(Map<String, dynamic> json) => _$ErrorsFromJson(json);

  Map<String, dynamic> toJson()=>_$ErrorsToJson(this);
}

EditProfileResponse _$EditProfileResponseFromJson(Map<String, dynamic> json) =>
    EditProfileResponse(
      statusResponse: json['respon_status'] == null
          ? null
          : StatusResponse.fromJson(
              json['respon_status'] as Map<String, dynamic>),
      errors: json['errors'] == null
          ? null
          : Errors.fromJson(json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EditProfileResponseToJson(
        EditProfileResponse instance) =>
    <String, dynamic>{
      'respon_status': instance.statusResponse,
      'errors': instance.errors,
    };

Errors _$ErrorsFromJson(Map<String, dynamic> json) => Errors(
      email: json['email'] == null
      ? null
      : json['email'][0] as String?,
      name:json['name'] == null
      ? null
      : json['name'][0] as String?,
      avatar:json['avatar'] == null
      ? null 
      : json['avatar'][0] as String?,
    );

Map<String, dynamic> _$ErrorsToJson(Errors instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.avatar,
    };