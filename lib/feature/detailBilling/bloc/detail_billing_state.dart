part of 'detail_billing_bloc.dart';

sealed class DetailBillingState extends Equatable {
  const DetailBillingState();
  
  @override
  List<Object> get props => [];
}

final class DetailBillingInitial extends DetailBillingState {}

final class DetailBillingExpiredTokenState extends DetailBillingState {
  final String message = "Your session has expired, please login again";
}

final class DetailBillingInitialProccesState extends DetailBillingState {}

final class DetailBillingInitialSuccesState extends DetailBillingState {
  final DetailBilling detailBilling;

  const DetailBillingInitialSuccesState(this.detailBilling);
}

final class DetailBillingInitialFailureState extends DetailBillingState{
  final String error;

  const DetailBillingInitialFailureState(this.error);
}