part of 'payment_method_bloc.dart';

sealed class PaymentMethodState extends Equatable {
  const PaymentMethodState();
  
  @override
  List<Object> get props => [];
}

final class PaymentMethodInitial extends PaymentMethodState {}

// ignore: must_be_immutable
final class PaymentMethodSuccesState extends PaymentMethodState {
  List<PaymentMethod> paymentMethods = [];

  PaymentMethodSuccesState(this.paymentMethods); 
}

final class PaymentMethodFailureState extends PaymentMethodState {
  final String error;

  const PaymentMethodFailureState(this.error);
}
