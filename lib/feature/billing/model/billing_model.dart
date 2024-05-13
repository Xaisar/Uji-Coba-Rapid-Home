import 'package:json_annotation/json_annotation.dart';

// part 'billing_model.g.dart';

// @JsonSerializable()
class BillingModel {
  String id;
  @JsonKey(name: "customer_id")
  String customerId;
  @JsonKey(name: "merchant_id")
  String merchantId;
  @JsonKey(name: "bill_number")
  String billNumber;
  @JsonKey(name: "bill_desc")
  String billdesc;
  @JsonKey(name: "customer_name")
  String customerName;
  String note;
  @JsonKey(name: "bill_date")
  DateTime billDate;
  @JsonKey(name: "due_date")
  DateTime dueDate;
  int total;
  int disc;
  int tax;
  @JsonKey(name: "grand_total")
  int grandTotal;
  @JsonKey(name: "total_paid")
  int totalPaid;
  @JsonKey(name: "payment_method")
  String? paymentMethod;
  @JsonKey(name: "payment_method_id")
  String? paymentMethodId;
  String status;
  @JsonKey(name: "has_sent_notif")
  int hasSentNotif;
  @JsonKey(name: "on_queue")
  int? onQueue;
  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: "updated_at")
  String updatedAt;

  BillingModel({
    required this.id,
    required this.customerId,
    required this.merchantId,
    required this.billNumber,
    required this.billdesc,
    required this.customerName,
    required this.note,
    required this.billDate,
    required this.dueDate,
    required this.total,
    required this.disc,
    required this.tax,
    required this.grandTotal,
    required this.totalPaid,
    this.paymentMethod,
    this.paymentMethodId,
    required this.status,
    required this.hasSentNotif,
    this.onQueue,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BillingModel.fromJson(Map<String, dynamic> json) => _$BillingModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillingModelToJson(this);

}

BillingModel _$BillingModelFromJson(Map<String, dynamic> json) => BillingModel(
      id: json['id'] as String,
      customerId: json['customer_id'] as String,
      merchantId: json['merchant_id'] as String,
      billNumber: json['bill_number'] as String,
      billdesc: json['bill_desc'] as String,
      customerName: json['customer_name'] as String,
      note: json['note'] as String,
      billDate: DateTime.parse(json['bill_date'] as String),
      dueDate: DateTime.parse(json['due_date'] as String),
      total: json['total'] as int,
      disc: json['disc'] as int,
      tax: json['tax'] as int,
      grandTotal: json['grand_total'] as int,
      totalPaid: json['total_paid'] as int,
      paymentMethod: json['payment_method'] == null
      ? null
      : json['payment_method'] as String?,
      paymentMethodId: json['payment_method_id'] == null
      ? null
      : json['payment_method_id'] as String?,
      status: json['status'] as String,
      hasSentNotif: json['has_sent_notif'] as int,
      onQueue: json['on_queue'] == null
      ? null
      : json['on_queue'] as int?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$BillingModelToJson(BillingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.customerId,
      'merchant_id': instance.merchantId,
      'bill_number': instance.billNumber,
      'bill_desc': instance.billdesc,
      'customer_name': instance.customerName,
      'note': instance.note,
      'bill_date': instance.billDate.toIso8601String(),
      'due_date': instance.dueDate.toIso8601String(),
      'total': instance.total,
      'disc': instance.disc,
      'tax': instance.tax,
      'grand_total': instance.grandTotal,
      'total_paid': instance.totalPaid,
      'payment_method': instance.paymentMethod,
      'payment_method_id': instance.paymentMethodId,
      'status': instance.status,
      'has_sent_notif': instance.hasSentNotif,
      'on_queue': instance.onQueue,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
