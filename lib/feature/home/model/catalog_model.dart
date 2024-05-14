import "package:json_annotation/json_annotation.dart";

// part 'catalog_model.g.dart';

// @JsonSerializable()
class Catalog {
  String id;
  @JsonKey(name: 'merchant_id')
  String merchatId;
  String name;
  String speed;
  String? tags;
  List<String> description = [];
  num price;
  @JsonKey(name: 'service_plan_id')
  String servicePlanId;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Catalog({
    required this.id,
    required this.merchatId,
    required this.name,
    required this.speed,
    this.tags,
    required this.description,
    required this.price,
    required this.servicePlanId,
    this.createdAt,
    this.updatedAt
  });

  factory Catalog.fromJson(Map<String, dynamic> json) => _$CatalogFromJson(json);

  Map<String, dynamic> toJson()=>_$CatalogToJson(this);
}

Catalog _$CatalogFromJson(Map<String, dynamic> json) => Catalog(
      id: json['id'] as String,
      merchatId: json['merchant_id'] as String,
      name: json['name'] as String,
      speed: json['speed'] as String,
      tags: json['tags'] as String?,
      description: json['description'] == null || json['description'].length == 0
      ? []
      : (json['description'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      price: json['price'] as num,
      servicePlanId: json['service_plan_id'] as String,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$CatalogToJson(Catalog instance) => <String, dynamic>{
      'id': instance.id,
      'merchant_id': instance.merchatId,
      'name': instance.name,
      'speed': instance.speed,
      'tags': instance.tags,
      'description': instance.description,
      'price': instance.price,
      'service_plan_id': instance.servicePlanId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
