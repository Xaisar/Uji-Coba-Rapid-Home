import 'package:json_annotation/json_annotation.dart';

import '../../authentication/model/response_status_model.dart';
import '../../billing/model/billing_model.dart';

// part 'get_billing_card_response_model.g.dart';

// @JsonSerializable()
class GetBillingCardResponse {
  @JsonKey(name: 'respon_status')
  StatusResponse? statusResponse;
  Data? data;

  GetBillingCardResponse({
    this.statusResponse,
    this.data
  });

  factory GetBillingCardResponse.fromJson(Map<String, dynamic> json) => _$GetBillingCardResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetBillingCardResponseToJson(this);

}

// @JsonSerializable()
class Data {
  @JsonKey(name: "records")
  BillingModel? billingModel;

  Data({
    this.billingModel
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

GetBillingCardResponse _$GetBillingCardResponseFromJson(
        Map<String, dynamic> json) =>
    GetBillingCardResponse(
      statusResponse: json['respon_status'] == null
          ? null
          : StatusResponse.fromJson(
              json['respon_status'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetBillingCardResponseToJson(
        GetBillingCardResponse instance) =>
    <String, dynamic>{
      'respon_status': instance.statusResponse,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      billingModel: json['records'] == null || json['records'].length == 0
          ? null
          : BillingModel.fromJson(json['records'][0] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'records': instance.billingModel,
    };