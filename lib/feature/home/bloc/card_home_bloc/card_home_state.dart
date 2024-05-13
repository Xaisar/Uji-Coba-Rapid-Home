part of 'card_home_bloc.dart';

sealed class CardHomeState extends Equatable {
  const CardHomeState();
  
  @override
  List<Object> get props => [];
}

final class CardHomeInitial extends CardHomeState {}

final class CardHomeInitialProccesState extends CardHomeState {}

final class CardHomeInitialSuccesstate extends CardHomeState {
  final Catalog? catalog;
  final BillingModel? billingModel;
  final String? speed;

  const CardHomeInitialSuccesstate(this.catalog, this.billingModel, this.speed);
}

final class CardHomeInitialFailureState extends CardHomeState {
  final String error;

  const CardHomeInitialFailureState(this.error);
}
