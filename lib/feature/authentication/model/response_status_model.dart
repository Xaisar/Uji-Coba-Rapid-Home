// import 'package:json_annotation/json_annotation.dart';

// part 'response_status_model.g.dart';

// @JsonSerializable()
class StatusResponse{
  final String status;
  final int code;
  final String message;

  const StatusResponse({
    required this.status,
    required this.code,
    required this.message
  });

  factory StatusResponse.fromJson(Map<String, dynamic> json) => _$StatusResponseFromJson(json);

  Map<String, dynamic> toJson()=>_$StatusResponseToJson(this);
}

StatusResponse _$StatusResponseFromJson(Map<String, dynamic> json) =>
    StatusResponse(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
    );

Map<String, dynamic> _$StatusResponseToJson(StatusResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
    };
