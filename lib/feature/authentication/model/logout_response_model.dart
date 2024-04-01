import 'package:json_annotation/json_annotation.dart';

import './response_status_model.dart';

// part 'logout_response_model.g.dart';

// @JsonSerializable()
class LogoutResponse{
  @JsonKey(name: 'respon_status')
  StatusResponse? statusResponse;

  LogoutResponse({
    this.statusResponse
  });

  factory LogoutResponse.fromJson(Map<String, dynamic> json) => _$LogoutResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutResponseToJson(this);
}

LogoutResponse _$LogoutResponseFromJson(Map<String, dynamic> json) =>
    LogoutResponse(
      statusResponse: json['respon_status'] == null
          ? null
          : StatusResponse.fromJson(
              json['respon_status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LogoutResponseToJson(LogoutResponse instance) =>
    <String, dynamic>{
      'respon_status': instance.statusResponse,
    };
