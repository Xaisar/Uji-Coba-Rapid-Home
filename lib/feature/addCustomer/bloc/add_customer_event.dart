part of 'add_customer_bloc.dart';

sealed class AddCustomerEvent extends Equatable {
  const AddCustomerEvent();

  @override
  List<Object> get props => [];
}

final class InitialAddCustomerEvent extends AddCustomerEvent{}

final class OnSubmiteEvent extends AddCustomerEvent{
  final String merchantId;
  final String customerId;

  const OnSubmiteEvent(this.merchantId, this.customerId);
}

final class OnValidateTokenEvent extends AddCustomerEvent {}