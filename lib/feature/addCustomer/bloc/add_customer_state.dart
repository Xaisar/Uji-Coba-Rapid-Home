part of 'add_customer_bloc.dart';

sealed class AddCustomerState extends Equatable {
  const AddCustomerState();
  
  @override
  List<Object> get props => [];
}

final class AddCustomerInitial extends AddCustomerState {}
