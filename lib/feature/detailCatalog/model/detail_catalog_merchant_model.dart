// import 'package:json_annotation/json_annotation.dart';

// part 'detail_catalog_merchant_model.g.dart';

// @JsonSerializable()
class Merchant{
  String id;
  String name;
  String email;
  String address;
  String? phone;
  String? code;
  String? logo;
  String? description;

  Merchant({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    this.phone,
    this.code,
    this.logo,
    this.description,
  });

  factory Merchant.fromJson(Map<String, dynamic> json) => _$MerchantFromJson(json);

  Map<String, dynamic> toJson() => _$MerchantToJson(this);
}

Merchant _$MerchantFromJson(Map<String, dynamic> json) => Merchant(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String?,
      code: json['code'] as String?,
      logo: json['logo'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$MerchantToJson(Merchant instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'phone': instance.phone,
      'code': instance.code,
      'logo': instance.logo,
      'description': instance.description,
    };