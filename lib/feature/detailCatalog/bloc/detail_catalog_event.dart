part of 'detail_catalog_bloc.dart';

sealed class DetailCatalogEvent extends Equatable {
  const DetailCatalogEvent();

  @override
  List<Object> get props => [];
}

final class DetailCatalogInitialEvent extends DetailCatalogEvent{
  final String catalogId;

  const DetailCatalogInitialEvent(this.catalogId);
}