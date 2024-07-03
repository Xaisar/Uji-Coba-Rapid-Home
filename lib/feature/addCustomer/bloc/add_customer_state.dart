part of 'add_customer_bloc.dart';

sealed class AddCustomerState extends Equatable {
  const AddCustomerState();
  
  @override
  List<Object> get props => [];
}

final class AddCustomerInitial extends AddCustomerState {}

final class AddMerhantSuccessState extends AddCustomerState {
  final List<Merchant> merchants;

  const AddMerhantSuccessState(this.merchants);
}

final class AddMerhantFailureState extends AddCustomerState {
  final String error;

  const AddMerhantFailureState(this.error);
}

final class OnSubmiteState extends AddCustomerState {}

final class NullErrorSubmittedState  extends AddCustomerState {}

final class AddCustomerSuccesState extends AddCustomerState {}

final class AddCustomerFailureState extends AddCustomerState {
  final String error;

  const AddCustomerFailureState(this.error);
}

final class OnValidateTokenState extends AddCustomerState {}

final class ValidateTokenSuccesState extends AddCustomerState {}

final class ValidateTokenFailureState extends AddCustomerState {
  final String error;

  const ValidateTokenFailureState(this.error);
}

final class AddCustomerTokenExpired extends AddCustomerState {
  final String message;

  const AddCustomerTokenExpired(this.message);
}