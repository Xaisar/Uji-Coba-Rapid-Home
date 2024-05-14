import 'package:json_annotation/json_annotation.dart';

import '../../authentication/model/response_status_model.dart';
import 'detail_catalog_model.dart';

// part 'get_detail_catalog_response_model.g.dart';

// @JsonSerializable()
class GetDetailCatalogResponse{
  @JsonKey(name: 'respon_status')
  StatusResponse? statusResponse;
  Data? data;

  GetDetailCatalogResponse({
    this.statusResponse,
    this.data
  });

  factory GetDetailCatalogResponse.fromJson(Map<String, dynamic> json) => _$GetDetailCatalogResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDetailCatalogResponseToJson(this);
}

// @JsonSerializable()
class Data{
  @JsonKey(name: 'records')
  DetailCatalog detailCatalog;
  
  Data({
    required this.detailCatalog
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

GetDetailCatalogResponse _$GetDetailCatalogResponseFromJson(
        Map<String, dynamic> json) =>
    GetDetailCatalogResponse(
      statusResponse: json['respon_status'] == null
          ? null
          : StatusResponse.fromJson(
              json['respon_status'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetDetailCatalogResponseToJson(
        GetDetailCatalogResponse instance) =>
    <String, dynamic>{
      'respon_status': instance.statusResponse,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      detailCatalog:
          DetailCatalog.fromJson(json['records'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'records': instance.detailCatalog,
    };
