import 'package:json_annotation/json_annotation.dart';

// part "edit_user_model.g.dart";

// @JsonSerializable()
class EditUser {
  String name;
  String email;
  @JsonKey(name: "_method")
  String method = "PUT";

  EditUser({
    required this.name,
    required this.email
  });

  factory EditUser.fromJson(Map<String, dynamic> json) => _$EditUserFromJson(json);

  Map<String, String> toJson() => _$EditUserToJson(this);
}

EditUser _$EditUserFromJson(Map<String, dynamic> json) => EditUser(
      name: json['name'] as String,
      email: json['email'] as String,
    );

Map<String, String> _$EditUserToJson(EditUser instance) => <String, String>{
      'name': instance.name,
      'email': instance.email,
      '_method': instance.method
    };