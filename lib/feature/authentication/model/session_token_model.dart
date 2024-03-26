import 'package:json_annotation/json_annotation.dart';

part 'session_token_model.g.dart';

@JsonSerializable()
class SessionToken {
  String accesToken;
  String tokenType;
  DateTime expiredDate;

  SessionToken({
    required this.accesToken,
    required this.tokenType,
    required this.expiredDate
  });

  factory SessionToken.fromJson(Map<String, dynamic> json) => _$SessionTokenFromJson(json);

  Map<String, dynamic> toJson()=>_$SessionTokenToJson(this);
}