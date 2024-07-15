// import 'package:json_annotation/json_annotation.dart';

// part 'petunjuk_payment_model.g.dart';

// @JsonSerializable()
class PetunjukPayment {
  String metode;
  List<String> petunjuk = [];

  PetunjukPayment({
    required this.metode,
    required this.petunjuk,
  });

  factory PetunjukPayment.fromJson(Map<String, dynamic> json) => _$PetunjukPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$PetunjukPaymentToJson(this);
}

PetunjukPayment _$PetunjukPaymentFromJson(Map<String, dynamic> json) =>
    PetunjukPayment(
      metode: json['metode'] as String,
      petunjuk:
          (json['petunjuk'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PetunjukPaymentToJson(PetunjukPayment instance) =>
    <String, dynamic>{
      'metode': instance.metode,
      'petunjuk': instance.petunjuk,
    };