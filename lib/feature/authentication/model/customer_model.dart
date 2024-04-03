import 'package:json_annotation/json_annotation.dart';

// part 'customer_model.g.dart';

// @JsonSerializable()
class Customer {
  final String id;
  @JsonKey(name: 'profile_group_id')
  final String profileGroupId;
  @JsonKey(name: 'service_plan_id')
  final String servicePlanId;
  @JsonKey(name: 'merchant_id')
  final String merchantId;
  final String name;
  final String username;
  final String profile;
  @JsonKey(name: 'identity_number')
  final String identityNumber;
  final String phone;
  final String city;
  final String email;
  final String code;
  final int ppn;
  final String address;
  @JsonKey(name: 'postal_code')
  String? postalCode;
  int? disabled;
  @JsonKey(name: 'is_online')
  int? isOnline;
  @JsonKey(name: 'notif_sent')
  bool? notifSent;
  @JsonKey(name: 'last_check')
  bool? lastCheck;

  Customer({
    required this.id,
    required this.profileGroupId,
    required this.servicePlanId,
    required this.merchantId,
    required this.name,
    required this.username,
    required this.profile,
    required this.identityNumber,
    required this.phone,
    required this.city,
    required this.email,
    required this.code,
    required this.ppn,
    required this.address,
    this.postalCode,
    this.disabled,
    this.isOnline,
    this.notifSent,
    this.lastCheck
  });

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: json['id'] as String,
      profileGroupId: json['profile_group_id'] as String,
      servicePlanId: json['service_plan_id'] as String,
      merchantId: json['merchant_id'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      profile: json['profile'] as String,
      identityNumber: json['identity_number'] as String,
      phone: json['phone'] as String,
      city: json['city'] as String,
      email: json['email'] as String,
      code: json['code'] as String,
      ppn: json['ppn'] as int,
      address: json['address'] as String,
      postalCode: json['postal_code'] == null //
      ? null
      : json['postal_code'] as String?,
      disabled: json['disabled'] as int?,
      isOnline: json['is_online'] as int?,
      notifSent: json['notif_sent'] == null //
      ? null
      : json['notif_sent'] as bool?,
      lastCheck: json['last_check'] == null //
      ? null
      : json['last_check'] as bool?, 
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'profile_group_id': instance.profileGroupId,
      'service_plan_id': instance.servicePlanId,
      'merchant_id': instance.merchantId,
      'name': instance.name,
      'username': instance.username,
      'profile': instance.profile,
      'identity_number': instance.identityNumber,
      'phone': instance.phone,
      'city': instance.city,
      'email': instance.email,
      'code': instance.code,
      'ppn': instance.ppn,
      'address': instance.address,
      'postal_code': instance.postalCode,
      'disabled': instance.disabled,
      'is_online': instance.isOnline,
      'notif_sent': instance.notifSent,
      'last_check': instance.lastCheck,
    };
