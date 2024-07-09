import 'package:json_annotation/json_annotation.dart';

import '../../authentication/model/response_status_model.dart';
import 'payment_detail_model.dart';

// part 'get_payment_detail_response_model.g.dart';

// @JsonSerializable()
class GetPaymentDetailResponse{
  @JsonKey(name: 'respon_status')
  StatusResponse? statusResponse;
  Data? data;

  GetPaymentDetailResponse({
    this.statusResponse,
    this.data
  });

  factory GetPaymentDetailResponse.fromJson(Map<String, dynamic> json) => _$GetPaymentDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPaymentDetailResponseToJson(this);
}

// @JsonSerializable()
class Data {
  @JsonKey(name: 'record')
  PaymentDetail paymentDetail;

  Data({
    required this.paymentDetail
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

GetPaymentDetailResponse _$GetPaymentDetailResponseFromJson(
        Map<String, dynamic> json) =>
    GetPaymentDetailResponse(
      statusResponse: json['respon_status'] == null
          ? null
          : StatusResponse.fromJson(
              json['respon_status'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetPaymentDetailResponseToJson(
        GetPaymentDetailResponse instance) =>
    <String, dynamic>{
      'respon_status': instance.statusResponse,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      paymentDetail:
          PaymentDetail.fromJson(json['record'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'record': instance.paymentDetail,
    };
