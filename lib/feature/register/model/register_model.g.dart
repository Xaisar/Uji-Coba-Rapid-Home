// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
