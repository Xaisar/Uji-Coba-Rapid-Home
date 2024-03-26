import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel extends Equatable{
  final String email;
  final String name;
  final String password;
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