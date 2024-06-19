part of 'card_home_bloc.dart';

sealed class CardHomeState extends Equatable {
  const CardHomeState();
  
  @override
  List<Object> get props => [];
}

final class CardHomeInitial extends CardHomeState {}

final class CardHomeExpiredTokenState extends CardHomeState {
  final String message = "Your session has expired, please login again";
}

final class CardHomeInitialProccesState extends CardHomeState {}

final class CardHomeInitialSuccesState extends CardHomeState {
  final Catalog? catalog;
  final BillingModel? billingModel;
  final String? speed;

  const CardHomeInitialSuccesState(this.catalog, this.billingModel, this.speed);
}

final class CardHomeInitialFailureState extends CardHomeState {
  final String error;

  const CardHomeInitialFailureState(this.error);
}
