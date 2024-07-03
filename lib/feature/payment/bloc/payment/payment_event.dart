part of 'payment_bloc.dart';

sealed class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

final class CancelPaymentEvent extends PaymentEvent {
  final String billId;

  const CancelPaymentEvent(this.billId);
}

final class SendPaymentEvent extends PaymentEvent {
  final Payment payment;

  const SendPaymentEvent(this.payment);
}
