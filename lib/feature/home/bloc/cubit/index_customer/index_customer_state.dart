part of 'index_customer_cubit.dart';

sealed class IndexCustomerState extends Equatable {
  const IndexCustomerState();

  @override
  List<Object> get props => [];
}

final class IndexCustomerInitial extends IndexCustomerState {}

final class IndexCustomerChangeState extends IndexCustomerState {
  final int indexCustomer;

  const IndexCustomerChangeState(this.indexCustomer);
}

final class IndexCustomerUpdateState extends IndexCustomerState {
  final int indexCustomer;

  const IndexCustomerUpdateState(this.indexCustomer);
}
