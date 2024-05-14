import 'package:json_annotation/json_annotation.dart';

import 'detail_catalog_merchant_model.dart';
import 'detail_catalog_service_plan_model.dart';

// part 'detail_catalog_model.g.dart';

// @JsonSerializable()
class DetailCatalog{
  String id;
  @JsonKey(name: 'merchant_id')
  String merchantId;
  Merchant merchant;
  String name;
  String speed;
  String? tags;
  List<String> description = [];
  int price;
  @JsonKey(name: 'service_plan_id')
  String servicePlanId;
  ServicePlan servicePlan;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  DetailCatalog({
    required this.id,
    required this.merchantId,
    required this.merchant,
    required this.name,
    required this.speed,
    this.tags,
    required this.description,
    required this.price,
    required this.servicePlanId,
    required this.servicePlan,
    this.createdAt,
    this.updatedAt,
  });

  factory DetailCatalog.fromJson(Map<String, dynamic> json) => _$DetailCatalogFromJson(json);

  Map<String, dynamic> toJson() => _$DetailCatalogToJson(this);
}

DetailCatalog _$DetailCatalogFromJson(Map<String, dynamic> json) =>
    DetailCatalog(
      id: json['id'] as String,
      merchantId: json['merchant_id'] as String,
      merchant: Merchant.fromJson(json['merchant'] as Map<String, dynamic>),
      name: json['name'] as String,
      speed: json['speed'] as String,
      tags: json['tags'] as String?,
      description: json['description'] == null ||  json['description'].length == 0
      ? []
      : (json['description'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      price: json['price'] % 1 == 0
      ? json['price'] as int
      : json['price'].toInt() as int,
      servicePlanId: json['service_plan_id'] as String,
      servicePlan:
          ServicePlan.fromJson(json['servicePlan'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$DetailCatalogToJson(DetailCatalog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'merchant_id': instance.merchantId,
      'merchant': instance.merchant,
      'name': instance.name,
      'speed': instance.speed,
      'tags': instance.tags,
      'description': instance.description,
      'price': instance.price,
      'service_plan_id': instance.servicePlanId,
      'servicePlan': instance.servicePlan,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
