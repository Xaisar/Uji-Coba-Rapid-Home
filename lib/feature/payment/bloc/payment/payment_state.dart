part of 'payment_bloc.dart';

sealed class PaymentState extends Equatable {
  const PaymentState();
  
  @override
  List<Object> get props => [];
}

final class PaymentInitial extends PaymentState {}

final class PaymentExpiredToken extends PaymentState {
  final String message;

  const PaymentExpiredToken(this.message);
}

final class PaymentProccesState extends PaymentState {}

final class PaymentProccesDoneState extends PaymentState {}

final class PaymentSuccesState extends PaymentState {}

final class PaymentFailureState extends PaymentState {
  final String error;

  const PaymentFailureState(this.error);
}

final class CancelPaymentProccesState extends PaymentState {}

final class CancelPaymentSuccesState extends PaymentState {}

final class CancelPaymentFailureState extends PaymentState {
  final String error;

  const CancelPaymentFailureState(this.error);
}