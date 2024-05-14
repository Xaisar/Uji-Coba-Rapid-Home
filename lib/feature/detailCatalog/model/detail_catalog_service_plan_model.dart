import 'package:json_annotation/json_annotation.dart';

// part 'detail_catalog_service_plan_model.g.dart';

// @JsonSerializable()
class ServicePlan{
  String id;
  @JsonKey(name: 'merchant_id')
  String merchantId;
  @JsonKey(name: 'profile_group_id')
  String? profileGroupId;
  String name;
  int price;
  @JsonKey(name: 'use_vpn')
  int useVpn;
  int recurring;

  ServicePlan({
    required this.id,
    required this.merchantId,
    this.profileGroupId,
    required this.name,
    required this.price,
    required this.useVpn,
    required this.recurring,
  });

  factory ServicePlan.fromJson(Map<String, dynamic> json) => _$ServicePlanFromJson(json);

  Map<String, dynamic> toJson() => _$ServicePlanToJson(this);
}

ServicePlan _$ServicePlanFromJson(Map<String, dynamic> json) => ServicePlan(
      id: json['id'] as String,
      merchantId: json['merchant_id'] as String,
      profileGroupId: json['profile_group_id'] as String?,
      name: json['name'] as String,
      price: json['price'] as int,
      useVpn: json['use_vpn'] as int,
      recurring: json['recurring'] as int,
    );

Map<String, dynamic> _$ServicePlanToJson(ServicePlan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'merchant_id': instance.merchantId,
      'profile_group_id': instance.profileGroupId,
      'name': instance.name,
      'price': instance.price,
      'use_vpn': instance.useVpn,
      'recurring': instance.recurring,
    };
