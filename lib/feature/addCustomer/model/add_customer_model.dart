import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
// part 'add_customer_model.g.dart';

// @JsonSerializable()
class AddCustomer extends Equatable{
  @JsonKey(name: 'merchant_id')
  final String merchantId;
  @JsonKey(name: 'code')
  final String customerId;

  const AddCustomer({
    this.merchantId = "",
    this.customerId = ""
  });

  factory AddCustomer.fromJson(Map<String, dynamic> json) => _$AddCustomerFromJson(json);

  Map<String, dynamic> toJson()=>_$AddCustomerToJson(this);
  
  @override
  List<Object?> get props => [merchantId, customerId];
}

AddCustomer _$AddCustomerFromJson(Map<String, dynamic> json) => AddCustomer(
      merchantId: json['merchant_id'] as String? ?? "",
      customerId: json['code'] as String? ?? "",
    );

Map<String, dynamic> _$AddCustomerToJson(AddCustomer instance) =>
    <String, dynamic>{
      'merchant_id': instance.merchantId,
      'code': instance.customerId,
    };
