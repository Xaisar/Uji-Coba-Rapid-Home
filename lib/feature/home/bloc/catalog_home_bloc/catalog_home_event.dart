part of 'catalog_home_bloc.dart';

sealed class CatalogHomeEvent extends Equatable {
  const CatalogHomeEvent();

  @override
  List<Object> get props => [];
}

final class InitialCatalogHome extends CatalogHomeEvent{}

final class CatalogHomeInitialEvent extends CatalogHomeEvent {
  final String customerId;

  const CatalogHomeInitialEvent(this.customerId);
}
