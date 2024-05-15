part of 'billing_bloc.dart';

sealed class BillingEvent extends Equatable {
  const BillingEvent();

  @override
  List<Object> get props => [];
}

final class InitialBillingEvent extends BillingEvent {}

final class OnRefreshBillingEvent extends BillingEvent {}