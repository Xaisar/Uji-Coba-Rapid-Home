import 'package:json_annotation/json_annotation.dart';

// part 'change_password_model.g.dart';

// @JsonSerializable()
class ChangePassword{
  String name;
  String email;
  String password;
  @JsonKey(name: "password_confirm")
  String passwordConfirm;
  @JsonKey(name: "_method")
  String method = "PUT";

  ChangePassword({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirm
  });

  factory ChangePassword.fromJson(Map<String, dynamic> json) => _$ChangePasswordFromJson(json);

  Map<String, String> toJson() => _$ChangePasswordToJson(this);
}

ChangePassword _$ChangePasswordFromJson(Map<String, dynamic> json) =>
    ChangePassword(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      passwordConfirm: json['password_confirm'] as String,
    )..method = json['_method'] as String;

Map<String, String> _$ChangePasswordToJson(ChangePassword instance) =>
    <String, String>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'password_confirm': instance.passwordConfirm,
      '_method': instance.method,
    };