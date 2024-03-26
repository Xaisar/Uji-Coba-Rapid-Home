import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  String id;
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