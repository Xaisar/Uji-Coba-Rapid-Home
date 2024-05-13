part of 'card_home_bloc.dart';

sealed class CardHomeEvent extends Equatable {
  const CardHomeEvent();

  @override
  List<Object> get props => [];
}

final class CardHomeInitialEvent extends CardHomeEvent {
  final String customerId;

  const CardHomeInitialEvent(this.customerId);
}
