import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'login_model.g.dart';

// @JsonSerializable() 
class LoginModel extends Equatable{
  // @JsonKey(name: "identify")
  final String email;
  final String password;

  const LoginModel({
    this.email = "" ,
    this.password = "" 
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

  Map<String, dynamic> toJson()=>_$LoginModelToJson(this);
  
  @override
  List<Object?> get props => [email, password];
}

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
  email: json['identify'] as String? ?? "",
  password: json['password'] as String? ?? "",
);

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
  <String, dynamic>{
    'identify': instance.email,
    'password': instance.password,
  };