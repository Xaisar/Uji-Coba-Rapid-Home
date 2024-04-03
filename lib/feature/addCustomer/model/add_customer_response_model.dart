import 'package:json_annotation/json_annotation.dart';

import '../../authentication/model/response_status_model.dart';

// part 'add_customer_response_model.g.dart';

// @JsonSerializable()
class AddCustomerResponse{
  @JsonKey(name: 'respon_status')
  StatusResponse? statusResponse;
  Data? data;
  Errors? errors;

  AddCustomerResponse({
    this.statusResponse,
    this.data,
    this.errors
  });

  factory AddCustomerResponse.fromJson(Map<String, dynamic> json) => _$AddCustomerResponseFromJson(json);

  Map<String, dynamic> toJson()=>_$AddCustomerResponseToJson(this);
}

// @JsonSerializable()
class Data{
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
}

// @JsonSerializable()
class Errors{
  @JsonKey(name: 'merchant_id')
  String? merchantId;
  @JsonKey(name: 'code')
  String? customerId;

  Errors({
    this.merchantId,
    this.customerId
  });

  factory Errors.fromJson(Map<String, dynamic> json) => _$ErrorsFromJson(json);

  Map<String, dynamic> toJson()=>_$ErrorsToJson(this);
}

AddCustomerResponse _$AddCustomerResponseFromJson(Map<String, dynamic> json) =>
    AddCustomerResponse(
      statusResponse: json['respon_status'] == null
          ? null
          : StatusResponse.fromJson(
              json['respon_status'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      errors: json['errors'] == null || json['errors'].length == 0
          ? null
          : Errors.fromJson(json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddCustomerResponseToJson(
        AddCustomerResponse instance) =>
    <String, dynamic>{
      'respon_status': instance.statusResponse,
      'data': instance.data,
      'errors': instance.errors,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data();

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{};

Errors _$ErrorsFromJson(Map<String, dynamic> json) => Errors(
      merchantId: json['merchant_id'] == null
      ? null
      : json['merchant_id'][0] as String?,
      customerId: json['code'] == null
      ? null
      : json['code'][0] as String?,
    );

Map<String, dynamic> _$ErrorsToJson(Errors instance) => <String, dynamic>{
      'merchant_id': instance.merchantId,
      'code': instance.customerId,
    };
