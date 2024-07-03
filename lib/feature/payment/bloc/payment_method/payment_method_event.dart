part of 'payment_method_bloc.dart';

sealed class PaymentMethodEvent extends Equatable {
  const PaymentMethodEvent();

  @override
  List<Object> get props => [];
}

final class InitialPaymentMethodEvent extends PaymentMethodEvent {
  final String billId;

  const InitialPaymentMethodEvent(this.billId);
}
