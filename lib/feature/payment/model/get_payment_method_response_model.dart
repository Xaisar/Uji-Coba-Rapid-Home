import 'package:json_annotation/json_annotation.dart';

import '../../authentication/model/response_status_model.dart';
import 'payment_method_model.dart';

// part 'get_payment_method_response_model.g.dart';

// @JsonSerializable()
class GetPaymentMethodResponse {
  @JsonKey(name: 'respon_status')
  StatusResponse? statusResponse;
  Data? data;

  GetPaymentMethodResponse({
    this.statusResponse,
    this.data
  });

  factory GetPaymentMethodResponse.fromJson(Map<String, dynamic> json) => _$GetPaymentMethodResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPaymentMethodResponseToJson(this);
}

// @JsonSerializable()
class Data {
  @JsonKey(name: 'records')
  List<PaymentMethod> paymentMethods = [];

  Data({
    required this.paymentMethods
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

GetPaymentMethodResponse _$GetPaymentMethodResponseFromJson(
        Map<String, dynamic> json) =>
    GetPaymentMethodResponse(
      statusResponse: json['respon_status'] == null
          ? null
          : StatusResponse.fromJson(
              json['respon_status'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetPaymentMethodResponseToJson(
        GetPaymentMethodResponse instance) =>
    <String, dynamic>{
      'respon_status': instance.statusResponse,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      paymentMethods: json['records'] == null
      ? []
      : (json['records'] as List<dynamic>)
          .map((e) => PaymentMethod.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'records': instance.paymentMethods,
    };