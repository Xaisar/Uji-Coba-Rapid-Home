import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'customer_model.g.dart';

@JsonSerializable()
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