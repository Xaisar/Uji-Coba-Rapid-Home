import '../../../utils/api_utils/api_utils.dart';
import '../../../utils/network_utils/network_utils.dart';
import '../model/get_detail_catalog_response_model.dart';

class DetailCatalogApi{

  Future<GetDetailCatalogResponse> detailCatalogService (String token, String catalogId) async{
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlGetDetailCatalog(catalogId);

    return await NetworkUtils().get(link, header).then((response) {
      return GetDetailCatalogResponse.fromJson(response);
    }).catchError((dynamic onError){
      return onError;
    });
  }
}