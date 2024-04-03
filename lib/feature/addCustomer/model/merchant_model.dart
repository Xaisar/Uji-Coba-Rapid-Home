// import 'package:json_annotation/json_annotation.dart';

// part 'merchant_model.g.dart';

// @JsonSerializable()
class Merchant{
  final String id;
  final String name;
  final String logo;

  Merchant({
    required this.id,
    required this.name,
    required this.logo
  });

  factory Merchant.fromJson(Map<String, dynamic> json) => _$MerchantFromJson(json);

  Map<String, dynamic> toJson()=>_$MerchantToJson(this);

}

Merchant _$MerchantFromJson(Map<String, dynamic> json) => Merchant(
      id: json['id'] as String,
      name: json['name'] as String,
      logo: json['logo'] as String,
    );

Map<String, dynamic> _$MerchantToJson(Merchant instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
    };