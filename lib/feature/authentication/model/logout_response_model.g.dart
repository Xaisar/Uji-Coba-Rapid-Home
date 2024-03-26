// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
