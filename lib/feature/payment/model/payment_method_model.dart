import 'package:json_annotation/json_annotation.dart';

// part 'payment_method_model.g.dart';

// @JsonSerializable()
class PaymentMethod {
  String value;
  String text;
  @JsonKey(name: 'additional_cost')
  int additionalCost;
  @JsonKey(name: 'type_cost')
  String typeCost;
  String logo;

  PaymentMethod({
    required this.value,
    required this.text,
    required this.additionalCost,
    required this.typeCost,
    required this.logo
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => _$PaymentMethodFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
}

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    PaymentMethod(
      value: json['value'] as String,
      text: json['text'] as String,
      additionalCost: json['additional_cost'] as int,
      typeCost: json['type_cost'] as String,
      logo: json['logo'] as String,
    );

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) =>
    <String, dynamic>{
      'value': instance.value,
      'text': instance.text,
      'additional_cost': instance.additionalCost,
      'type_cost': instance.typeCost,
      'logo': instance.logo,
    };