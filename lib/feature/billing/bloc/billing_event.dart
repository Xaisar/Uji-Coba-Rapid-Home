part of 'billing_bloc.dart';

sealed class BillingEvent extends Equatable {
  const BillingEvent();

  @override
  List<Object> get props => [];
}

final class InitialBilling extends BillingEvent {}

final class InitialBillingEvent extends BillingEvent {
  final Customer customer;

  const InitialBillingEvent(this.customer);
}

final class OnRefreshBillingEvent extends BillingEvent {}