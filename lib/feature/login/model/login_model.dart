import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

// @JsonSerializable()
class LoginModel extends Equatable{
  final String email;
  final String password;

  @override
  const LoginModel({
    this.email = "" ,
    this.password = "" 
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

  Map<String, dynamic> toJson()=>_$LoginModelToJson(this);
  
  @override
  List<Object?> get props => [email, password];
}