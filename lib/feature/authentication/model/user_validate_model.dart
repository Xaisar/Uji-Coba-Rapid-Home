import 'package:json_annotation/json_annotation.dart';

import 'customer_validate_model.dart';

// part 'user_model.g.dart';

// @JsonSerializable()
class UserValidate {
  String id;
  @JsonKey(name: 'global_id')
  String globalId;
  String name;
  String email;
  String? avatar;
  List<CustomerValidate> customers;

  UserValidate({
    required this.id,
    required this.globalId,
    required this.name,
    required this.email,
    this.avatar,
    required this.customers
  });

  factory UserValidate.fromJson(Map<String, dynamic> json) => _$UserValidateFromJson(json);

  Map<String, dynamic> toJson() => _$UserValidateToJson(this);
}

UserValidate _$UserValidateFromJson(Map<String, dynamic> json) => UserValidate(
      id: json['id'] as String,
      globalId: json['global_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String?,
      customers: (json['customers'] as List<dynamic>)
          .map((e) => CustomerValidate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserValidateToJson(UserValidate instance) => <String, dynamic>{
      'id': instance.id,
      'global_id': instance.globalId,
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.avatar,
      'customers': instance.customers,
    };
