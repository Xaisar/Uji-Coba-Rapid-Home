import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'register_model.g.dart';

// @JsonSerializable()
class RegisterModel extends Equatable{
  final String email;
  final String name;
  final String password;
  @JsonKey(name: 'password_confirm')
  final String confirmPassword;

  const RegisterModel({
    this.email = "",
    this.name = "",
    this.password = "",
    this.confirmPassword = ""
  });
  
  factory RegisterModel.fromJson(Map<String, dynamic> json) => _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson()=>_$RegisterModelToJson(this);

  @override
  List<Object?> get props => [email, name, password, confirmPassword];
}

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      email: json['email'] as String? ?? "",
      name: json['name'] as String? ?? "",
      password: json['password'] as String? ?? "",
      confirmPassword: json['password_confirm'] as String? ?? "",
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'password': instance.password,
      'password_confirm': instance.confirmPassword,
    };