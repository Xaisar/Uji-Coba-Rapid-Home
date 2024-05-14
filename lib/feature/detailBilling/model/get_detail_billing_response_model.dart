import 'package:json_annotation/json_annotation.dart';

import '../../authentication/model/response_status_model.dart';
import 'detail_billing_model.dart';

// part 'get_detail_billing_response_model.g.dart';

// @JsonSerializable()
class GetDetailBillingResponse{
  @JsonKey(name: 'respon_status')
  StatusResponse? statusResponse;
  Data? data;

  GetDetailBillingResponse({
    this.statusResponse,
    this.data
  });

  factory GetDetailBillingResponse.fromJson(Map<String, dynamic> json) => _$GetDetailBillingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDetailBillingResponseToJson(this);
}

// @JsonSerializable()
class Data{
  @JsonKey(name: 'records')
  DetailBilling detailBilling;

  Data({
    required this.detailBilling
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

GetDetailBillingResponse _$GetDetailBillingResponseFromJson(
        Map<String, dynamic> json) =>
    GetDetailBillingResponse(
      statusResponse: json['respon_status'] == null
          ? null
          : StatusResponse.fromJson(
              json['respon_status'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetDetailBillingResponseToJson(
        GetDetailBillingResponse instance) =>
    <String, dynamic>{
      'respon_status': instance.statusResponse,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      detailBilling:
          DetailBilling.fromJson(json['records'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'records': instance.detailBilling,
    };
