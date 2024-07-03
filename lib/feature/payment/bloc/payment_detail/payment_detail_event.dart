part of 'payment_detail_bloc.dart';

sealed class PaymentDetailEvent extends Equatable {
  const PaymentDetailEvent();

  @override
  List<Object> get props => [];
}

final class InitialDetailPaymentEvent extends PaymentDetailEvent {
  final String billId;

  const InitialDetailPaymentEvent(this.billId);
}
