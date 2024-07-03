import 'package:json_annotation/json_annotation.dart';

import '../../authentication/model/response_status_model.dart';

// part 'get_payment_response_model.g.dart';

// @JsonSerializable()
class GetPaymentResponse {
  @JsonKey(name: 'respon_status')
  StatusResponse? statusResponse;
  Errors? errors;

  GetPaymentResponse({
    this.statusResponse,
    this.errors
  });

  factory GetPaymentResponse.fromJson(Map<String, dynamic> json) => _$GetPaymentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPaymentResponseToJson(this);
}

// @JsonSerializable()
class Errors{
  @JsonKey(name: 'bill_id')
  String? billId;
  @JsonKey(name: 'channel_list_id')
  String? channelListId;

  Errors({
    this.billId,
    this.channelListId
  });

  factory Errors.fromJson(Map<String, dynamic> json) => _$ErrorsFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorsToJson(this);
}

GetPaymentResponse _$GetPaymentResponseFromJson(Map<String, dynamic> json) =>
    GetPaymentResponse(
      statusResponse: json['respon_status'] == null
          ? null
          : StatusResponse.fromJson(
              json['respon_status'] as Map<String, dynamic>),
      errors: json['errors'] == null
          ? null
          : Errors.fromJson(json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetPaymentResponseToJson(GetPaymentResponse instance) =>
    <String, dynamic>{
      'respon_status': instance.statusResponse,
      'errors': instance.errors,
    };

Errors _$ErrorsFromJson(Map<String, dynamic> json) => Errors(
      billId: json['bill_id'] == null
      ? null
      : json['bill_id'][0] as String?,
      channelListId: json['channel_list_id'] == null 
      ? null
      : json['channel_list_id'][0] as String?,
    );

Map<String, dynamic> _$ErrorsToJson(Errors instance) => <String, dynamic>{
      'bill_id': instance.billId,
      'channel_list_id': instance.channelListId,
    };