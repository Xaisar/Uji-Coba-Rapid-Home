part of 'catalog_home_bloc.dart';

sealed class CatalogHomeState extends Equatable {
  const CatalogHomeState();
  
  @override
  List<Object> get props => [];
}

final class CatalogHomeInitial extends CatalogHomeState {}

final class CatalogHomeExpiredTokenState extends CatalogHomeState {
  final String message;

  const CatalogHomeExpiredTokenState(this.message);
}

final class CatalogHomeInitialProccesState extends CatalogHomeState {}

// ignore: must_be_immutable
final class CatalogHomeInitialSuccesstate extends CatalogHomeState {
  List<Catalog> catalogs = [];

  CatalogHomeInitialSuccesstate(this.catalogs);
}

final class CatalogHomeInitialFailureState extends CatalogHomeState {
  final String error;

  const CatalogHomeInitialFailureState(this.error);
}
