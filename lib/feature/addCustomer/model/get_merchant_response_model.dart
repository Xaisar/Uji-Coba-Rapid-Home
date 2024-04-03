import 'package:json_annotation/json_annotation.dart';

import '../../authentication/model/response_status_model.dart';
import 'merchant_model.dart';

// part 'get_merchant_response_model.g.dart';

// @JsonSerializable()
class GetMerchantResponse {
  @JsonKey(name: 'respon_status')
  StatusResponse? statusResponse;
  Data? data;

  GetMerchantResponse({
    this.statusResponse,
    this.data
  });

  factory GetMerchantResponse.fromJson(Map<String, dynamic> json) => _$GetMerchantResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMerchantResponseToJson(this);
}

// @JsonSerializable()
class Data{
  @JsonKey(name: 'records')
  List<Merchant> merchants;

  Data({
    required this.merchants
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

GetMerchantResponse _$GetMerchantResponseFromJson(Map<String, dynamic> json) =>
    GetMerchantResponse(
      statusResponse: json['respon_status'] == null
          ? null
          : StatusResponse.fromJson(
              json['respon_status'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetMerchantResponseToJson(
        GetMerchantResponse instance) =>
    <String, dynamic>{
      'respon_status': instance.statusResponse,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      merchants: (json['records'] as List<dynamic>)
          .map((e) => Merchant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'records': instance.merchants,
    };
