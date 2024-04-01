import 'package:json_annotation/json_annotation.dart';

// part 'session_token_model.g.dart';

// @JsonSerializable()
class SessionToken {
  @JsonKey(name: 'access_token')
  String accesToken;
  @JsonKey(name: 'token_type')
  String tokenType;
  @JsonKey(name: 'expires_in')
  DateTime expiredDate;

  SessionToken({
    required this.accesToken,
    required this.tokenType,
    required this.expiredDate
  });

  factory SessionToken.fromJson(Map<String, dynamic> json) => _$SessionTokenFromJson(json);

  Map<String, dynamic> toJson()=>_$SessionTokenToJson(this);
}

SessionToken _$SessionTokenFromJson(Map<String, dynamic> json) => SessionToken(
      accesToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
      expiredDate: DateTime.parse(json['expires_in'] as String),
    );

Map<String, dynamic> _$SessionTokenToJson(SessionToken instance) =>
    <String, dynamic>{
      'access_token': instance.accesToken,
      'token_type': instance.tokenType,
      'expires_in': instance.expiredDate.toIso8601String(),
    };
