import 'package:json_annotation/json_annotation.dart';

import 'customer_model.dart';

// part 'user_model.g.dart';

// @JsonSerializable()
class User {
  String id;
  @JsonKey(name: 'global_id')
  String globalId;
  String name;
  String email;
  String? avatar;
  List<Customer> customers;

  User({
    required this.id,
    required this.globalId,
    required this.name,
    required this.email,
    this.avatar,
    required this.customers
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserValidateFromJson(json);

  Map<String, dynamic> toJson() => _$UserValidateToJson(this);
}

User _$UserValidateFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      globalId: json['global_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String?,
      customers: (json['customers'] as List<dynamic>)
          .map((e) => Customer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserValidateToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'global_id': instance.globalId,
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.avatar,
      'customers': instance.customers,
    };
