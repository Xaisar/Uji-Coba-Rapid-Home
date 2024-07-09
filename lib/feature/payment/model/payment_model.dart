import 'package:json_annotation/json_annotation.dart';

// part 'payment_model.g.dart';

// @JsonSerializable()
class Payment{
  @JsonKey(name: 'bill_id')
  String billId;
  @JsonKey(name: 'channel_list_id')
  String channelListId;

  Payment({
    required this.billId,
    required this.channelListId
  });

  factory Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      billId: json['bill_id'] as String,
      channelListId: json['channel_list_id'] as String,
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'bill_id': instance.billId,
      'channel_list_id': instance.channelListId,
    };