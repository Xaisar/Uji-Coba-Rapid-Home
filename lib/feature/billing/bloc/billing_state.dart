part of 'billing_bloc.dart';

sealed class BillingState extends Equatable {
  const BillingState();
  
  @override
  List<Object> get props => [];
}

final class BillingInitial extends BillingState {}

final class GetBillingProcessState extends BillingState {}

// ignore: must_be_immutable
final class GetBillingSuccesState extends BillingState {
  List<BillingModel> billings = [];

  GetBillingSuccesState(this.billings);
}

final class GetBillingFailureState extends BillingState {
  final String error;

  const GetBillingFailureState(this.error);
}

final class OnRefreshBillingProccesState extends BillingState {}

// ignore: must_be_immutable
final class OnRefreshBillingSuccesState extends BillingState {
  List<BillingModel> billings = [];

  OnRefreshBillingSuccesState(this.billings);
}

final class OnRefreshBillingFailureState extends BillingState {
  final String error;

  const OnRefreshBillingFailureState(this.error);
}
