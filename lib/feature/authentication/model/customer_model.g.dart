// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
      postalCode: json['postal_code'] as String?,
      disabled: json['disabled'] as int?,
      isOnline: json['is_online'] as int?,
      notifSent: json['notif_sent'] as bool?,
      lastCheck: json['last_check'] as bool?,
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
