import 'package:json_annotation/json_annotation.dart';

// part 'payment_detail_model.g.dart';

// @JsonSerializable()
class PaymentDetail{
  String name;
  String? bank;
  @JsonKey(name: 'account_number')
  String? accountNumber;
  int total;
  DateTime? expired;
  @JsonKey(name: 'merchant_code')
  String? merchantCode;
  @JsonKey(name: 'bill_number')
  String billNumber;
  @JsonKey(name: 'bill_desc')
  String billDesc;
  @JsonKey(name: 'bill_date')
  DateTime billDate;
  @JsonKey(name: 'due_date')
  DateTime dueDate;
  String status;
  Meta? meta;

  PaymentDetail({
    required this.name,
    this.bank,
    this.accountNumber,
    required this.total,
    this.expired,
    this.merchantCode,
    required this.billNumber,
    required this.billDesc,
    required this.billDate,
    required this.dueDate,
    required this.status,
    this.meta
  });

  factory PaymentDetail.fromJson(Map<String, dynamic> json) => _$PaymentDetailFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentDetailToJson(this);
}

// @JsonSerializable()
class Meta {
  @JsonKey(name: 'transaction_type')
  String transactionType;
  @JsonKey(name: 'transaction_time')
  DateTime transactionTime;
  @JsonKey(name: 'transaction_status')
  String transactionStatus;
  @JsonKey(name: 'transaction_id')
  String transactionId;
  @JsonKey(name: 'status_message')
  String statusMessage;
  @JsonKey(name: 'status_code')
  String statusCode;
  @JsonKey(name: 'signature_key')
  String signatureKey;
  @JsonKey(name: 'reference_id')
  String referenceId;
  @JsonKey(name: 'payment_type')
  String paymentType;
  @JsonKey(name: 'order_id')
  String orderId;
  @JsonKey(name: 'merchant_id')
  String merchantId;
  @JsonKey(name: 'gross_amount')
  String grossAmount;
  @JsonKey(name: 'fraud_status')
  String fraudStatus;
  @JsonKey(name: 'expiry_time')
  DateTime expiryTime;
  @JsonKey(name: 'custom_field2')
  String customField2;
  @JsonKey(name: 'custom_field1')
  String customField1;
  String currency;
  String acquirer;
  @JsonKey(name: 'qr_code')
  String qrCode;
  String type;
  String channel;
  @JsonKey(name: 'id_from_channel')
  String idFromChannel;

  Meta({
    required this.transactionType,
    required this.transactionTime,
    required this.transactionStatus,
    required this.transactionId,
    required this.statusMessage,
    required this.statusCode,
    required this.signatureKey,
    required this.referenceId,
    required this.paymentType,
    required this.orderId,
    required this.merchantId,
    required this.grossAmount,
    required this.fraudStatus,
    required this.expiryTime,
    required this.customField2,
    required this.customField1,
    required this.currency,
    required this.acquirer,
    required this.qrCode,
    required this.type,
    required this.channel,
    required this.idFromChannel
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

PaymentDetail _$PaymentDetailFromJson(Map<String, dynamic> json) =>
    PaymentDetail(
      name: json['name'] as String,
      bank: json['bank'] == null
      ? null 
      : json['bank'] as String?,
      accountNumber: json['account_number'] == null
      ? null 
      : json['account_number'] as String?,
      total: json['total'] as int,
      expired: json['expired'] == null
          ? null
          : DateTime.parse(json['expired'] as String),
      merchantCode: json['merchant_code'] == null
      ? null
      : json['merchant_code'] as String?,
      billNumber: json['bill_number'] as String,
      billDesc: json['bill_desc'] as String,
      billDate: DateTime.parse(json['bill_date'] as String),
      dueDate: DateTime.parse(json['due_date'] as String),
      status: json['status'] as String,
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentDetailToJson(PaymentDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'bank': instance.bank,
      'account_number': instance.accountNumber,
      'total': instance.total,
      'expired': instance.expired?.toIso8601String(),
      'merchant_code': instance.merchantCode,
      'bill_number': instance.billNumber,
      'bill_desc': instance.billDesc,
      'bill_date': instance.billDate.toIso8601String(),
      'due_date': instance.dueDate.toIso8601String(),
      'status': instance.status,
      'meta': instance.meta,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      transactionType: json['transaction_type'] as String,
      transactionTime: DateTime.parse(json['transaction_time'] as String),
      transactionStatus: json['transaction_status'] as String,
      transactionId: json['transaction_id'] as String,
      statusMessage: json['status_message'] as String,
      statusCode: json['status_code'] as String,
      signatureKey: json['signature_key'] as String,
      referenceId: json['reference_id'] as String,
      paymentType: json['payment_type'] as String,
      orderId: json['order_id'] as String,
      merchantId: json['merchant_id'] as String,
      grossAmount: json['gross_amount'] as String,
      fraudStatus: json['fraud_status'] as String,
      expiryTime: DateTime.parse(json['expiry_time'] as String),
      customField2: json['custom_field2'] as String,
      customField1: json['custom_field1'] as String,
      currency: json['currency'] as String,
      acquirer: json['acquirer'] as String,
      qrCode: json['qr_code'] as String,
      type: json['type'] as String,
      channel: json['channel'] as String,
      idFromChannel: json['id_from_channel'] as String,
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'transaction_type': instance.transactionType,
      'transaction_time': instance.transactionTime.toIso8601String(),
      'transaction_status': instance.transactionStatus,
      'transaction_id': instance.transactionId,
      'status_message': instance.statusMessage,
      'status_code': instance.statusCode,
      'signature_key': instance.signatureKey,
      'reference_id': instance.referenceId,
      'payment_type': instance.paymentType,
      'order_id': instance.orderId,
      'merchant_id': instance.merchantId,
      'gross_amount': instance.grossAmount,
      'fraud_status': instance.fraudStatus,
      'expiry_time': instance.expiryTime.toIso8601String(),
      'custom_field2': instance.customField2,
      'custom_field1': instance.customField1,
      'currency': instance.currency,
      'acquirer': instance.acquirer,
      'qr_code': instance.qrCode,
      'type': instance.type,
      'channel': instance.channel,
      'id_from_channel': instance.idFromChannel,
    };