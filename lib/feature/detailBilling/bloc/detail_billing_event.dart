part of 'detail_billing_bloc.dart';

sealed class DetailBillingEvent extends Equatable {
  const DetailBillingEvent();

  @override
  List<Object> get props => [];
}

final class DetailBillingInitialEvent extends DetailBillingEvent {
  final String billingId;

  const DetailBillingInitialEvent(this.billingId);
}