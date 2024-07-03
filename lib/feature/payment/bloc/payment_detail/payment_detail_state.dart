part of 'payment_detail_bloc.dart';

sealed class PaymentDetailState extends Equatable {
  const PaymentDetailState();
  
  @override
  List<Object> get props => [];
}

final class PaymentDetailInitial extends PaymentDetailState {}

final class PaymentDetailProccesState extends PaymentDetailState {}

final class PaymentDetailFailureState extends PaymentDetailState {
  final String error;

  const PaymentDetailFailureState(this.error);
}

final class PaymentDetailActiveState extends PaymentDetailState {
  final PaymentDetail paymentDetail;

  const PaymentDetailActiveState(this.paymentDetail);
}

final class PaymentDetailPostedState extends PaymentDetailState {
  final PaymentDetail paymentDetail;

  const PaymentDetailPostedState(this.paymentDetail);
}

final class PaymentDetailDoneState extends PaymentDetailState {}
