import 'package:json_annotation/json_annotation.dart';

// part 'user_model.g.dart';

// @JsonSerializable()
class User {
  String id;
  @JsonKey(name: 'global_id')
  String globalId;
  String name;
  String email;
  String? avatar;

  User({
    required this.id,
    required this.globalId,
    required this.name,
    required this.email,
    this.avatar
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      globalId: json['global_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'global_id': instance.globalId,
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.avatar,
    };
