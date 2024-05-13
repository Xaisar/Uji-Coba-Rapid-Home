import 'package:isp_management_app/feature/authentication/model/response_status_model.dart';
import 'package:json_annotation/json_annotation.dart';

import './billing_model.dart';

// part "get_billing_response_model.g.dart";

// @JsonSerializable()
class GetBillingResponse{
  @JsonKey(name: 'respon_status')
  StatusResponse? statusResponse;
  Data? data;

  GetBillingResponse({
    this.statusResponse,
    this.data
  });

  factory GetBillingResponse.fromJson(Map<String, dynamic> json) => _$GetBillingResponseFromJson(json);

  Map<String, dynamic> toJson()=>_$GetBillingResponseToJson(this);
}

// @JsonSerializable()
class Data {
  @JsonKey(name: "records")
  List<BillingModel> billings;

  Data({
    required this.billings
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);
}

GetBillingResponse _$GetBillingResponseFromJson(Map<String, dynamic> json) =>
    GetBillingResponse(
      statusResponse: json['respon_status'] == null
          ? null
          : StatusResponse.fromJson(
              json['respon_status'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetBillingResponseToJson(GetBillingResponse instance) =>
    <String, dynamic>{
      'respon_status': instance.statusResponse,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      billings: json["records"] == null || json["records"].length == 0
      ? []
      : (json['records'] as List<dynamic>)
          .map((e) => BillingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'records': instance.billings,
    };
