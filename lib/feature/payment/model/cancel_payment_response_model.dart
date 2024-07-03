import 'package:json_annotation/json_annotation.dart';

import '../../authentication/model/response_status_model.dart';

// part 'cancel_payment_response_model.g.dart';

// @JsonSerializable()
class CancelPaymentResponse {
  @JsonKey(name: 'respon_status')
  StatusResponse? statusResponse;
  Errors? errors;

  CancelPaymentResponse({
    this.statusResponse,
    this.errors
  });

  factory CancelPaymentResponse.fromJson(Map<String, dynamic> json) => _$CancelPaymentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CancelPaymentResponseToJson(this);
}

// @JsonSerializable()
class Errors {
  @JsonKey(name: 'bill_id')
  String? billId;

  Errors({
    this.billId
  });

  factory Errors.fromJson(Map<String, dynamic> json) => _$ErrorsFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorsToJson(this);
}

CancelPaymentResponse _$CancelPaymentResponseFromJson(
        Map<String, dynamic> json) =>
    CancelPaymentResponse(
      statusResponse: json['respon_status'] == null
          ? null
          : StatusResponse.fromJson(
              json['respon_status'] as Map<String, dynamic>),
      errors: json['errors'] == null
          ? null
          : Errors.fromJson(json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CancelPaymentResponseToJson(
        CancelPaymentResponse instance) =>
    <String, dynamic>{
      'respon_status': instance.statusResponse,
      'errors': instance.errors,
    };

Errors _$ErrorsFromJson(Map<String, dynamic> json) => Errors(
      billId: json['bill_id'] == null
      ? null
      : json['bill_id'][0] as String?,
    );

Map<String, dynamic> _$ErrorsToJson(Errors instance) => <String, dynamic>{
      'bill_id': instance.billId,
    };