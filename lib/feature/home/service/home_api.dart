import '../../../utils/api_utils/api_utils.dart';
import '../../../utils/network_utils/network_utils.dart';
import '../model/get_billing_card_response_model.dart';
import '../model/get_catalog_card_response_model.dart';
import '../model/get_catalogs_response_model.dart';

class HomeApi{
  
  Future<GetCatalogCardResponse> catalogCardService (String token, String customerId) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlGetCatalogCardHome(customerId);

    return await NetworkUtils().get(link, header).then((response) {
      return GetCatalogCardResponse.fromJson(response);
    });
  }

  Future<GetBillingCardResponse> billingCardService (String token, String customerId) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlGetBilling(customerId);

    return await NetworkUtils().get(link, header).then((response) {
      return GetBillingCardResponse.fromJson(response); 
    });
  }
  
  Future<GetCatalogsResponse> catalogsService (String token, String customerId) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlGetCatalogs(customerId);

    return await NetworkUtils().get(link, header).then((response) {
      return GetCatalogsResponse.fromJson(response);
    });
  }
}