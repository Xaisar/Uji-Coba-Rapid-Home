import 'package:json_annotation/json_annotation.dart';

import './response_status_model.dart';

part 'logout_response_model.g.dart';

@JsonSerializable()
class LogoutResponse{
  StatusResponse? statusResponse;

  LogoutResponse({
    this.statusResponse
  });

  factory LogoutResponse.fromJson(Map<String, dynamic> json) => _$LogoutResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutResponseToJson(this);
}