part of 'detail_catalog_bloc.dart';

sealed class DetailCatalogState extends Equatable {
  const DetailCatalogState();
  
  @override
  List<Object> get props => [];
}

final class DetailCatalogInitial extends DetailCatalogState {}

final class DetailCatalogInitialProccesState extends DetailCatalogState {}

final class DetailCatalogInitialSuccesState extends DetailCatalogState {
  final DetailCatalog detailCatalog;

  const DetailCatalogInitialSuccesState(this.detailCatalog);
}

final class DetailCatalogInitialFailureState extends DetailCatalogState {
  final String error;

  const DetailCatalogInitialFailureState(this.error);
}