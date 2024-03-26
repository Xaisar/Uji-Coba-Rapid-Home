import 'package:json_annotation/json_annotation.dart';

part 'response_status_model.g.dart';

@JsonSerializable()
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