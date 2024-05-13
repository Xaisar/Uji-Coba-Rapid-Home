import 'package:json_annotation/json_annotation.dart';

import '../../authentication/model/response_status_model.dart';
import 'catalog_model.dart';

// part 'get_catalog_card_response_model.g.dart';

// @JsonSerializable()
class GetCatalogCardResponse {
  @JsonKey(name: 'respon_status')
  StatusResponse? statusResponse;
  Data? data;

  GetCatalogCardResponse({
    this.statusResponse,
    this.data
  });

  factory GetCatalogCardResponse.fromJson(Map<String, dynamic> json) => _$GetCatalogCardResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCatalogCardResponseToJson(this);
}

// @JsonSerializable()
class Data{
  @JsonKey(name: 'records')
  Catalog? catalog;

  Data({
    this.catalog
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);  
}

GetCatalogCardResponse _$GetCatalogCardResponseFromJson(
        Map<String, dynamic> json) =>
    GetCatalogCardResponse(
      statusResponse: json['respon_status'] == null
          ? null
          : StatusResponse.fromJson(
              json['respon_status'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCatalogCardResponseToJson(
        GetCatalogCardResponse instance) =>
    <String, dynamic>{
      'respon_status': instance.statusResponse,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      catalog: json['records'].length == 0 
      ? null
      : Catalog.fromJson(json['records'][0] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'catalog': instance.catalog,
    };


