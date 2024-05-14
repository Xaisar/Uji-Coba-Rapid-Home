import '../../../utils/api_utils/api_utils.dart';
import '../../../utils/network_utils/network_utils.dart';
import '../model/get_detail_billing_response_model.dart';

class DetailBillingApi{

  Future<GetDetailBillingResponse> detailBillingService (String token, String billingId) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlGetDetailBilling(billingId);

    return await NetworkUtils().get(link, header).then((response) {
      return GetDetailBillingResponse.fromJson(response);
    }).catchError((dynamic onError) {
      return onError;
    });

  }
}