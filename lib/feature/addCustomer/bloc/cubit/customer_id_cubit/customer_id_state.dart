part of 'customer_id_cubit.dart';

sealed class CustomerIdState extends Equatable {
  const CustomerIdState();

  @override
  List<Object> get props => [];
}

final class CustomerIdInitial extends CustomerIdState {}

final class OnChangeCustomerIdState extends CustomerIdState {}

final class NullErrorCustomerIdState extends CustomerIdState {}