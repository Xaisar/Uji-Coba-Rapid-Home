import 'package:json_annotation/json_annotation.dart';

import '../../authentication/model/response_status_model.dart';
import 'catalog_model.dart';

// part 'get_catalogs_response_model.g.dart';

// @JsonSerializable()
class GetCatalogsResponse{
  @JsonKey(name: 'respon_status')
  StatusResponse? statusResponse;
  Data? data;

  GetCatalogsResponse({
    this.statusResponse,
    this.data
  });

  factory GetCatalogsResponse.fromJson(Map<String, dynamic> json) => _$GetCatalogsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCatalogsResponseToJson(this);
}

// @JsonSerializable()
class Data{
  @JsonKey(name: 'records')
  List<Catalog> catalogs = [];

  Data({
    required this.catalogs
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

GetCatalogsResponse _$GetCatalogsResponseFromJson(Map<String, dynamic> json) =>
    GetCatalogsResponse(
      statusResponse: json['respon_status'] == null
          ? null
          : StatusResponse.fromJson(
              json['respon_status'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCatalogsResponseToJson(
        GetCatalogsResponse instance) =>
    <String, dynamic>{
      'respon_status': instance.statusResponse,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      catalogs: json['records'].length == 0 || json['records'] == null
      ? []
      : (json['records'] as List<dynamic>)
          .map((e) => Catalog.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'records': instance.catalogs,
    };
