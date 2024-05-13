part of 'detail_billing_bloc.dart';

sealed class DetailBillingState extends Equatable {
  const DetailBillingState();
  
  @override
  List<Object> get props => [];
}

final class DetailBillingInitial extends DetailBillingState {}
