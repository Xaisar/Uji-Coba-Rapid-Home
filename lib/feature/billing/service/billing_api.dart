
import 'package:isp_management_app/utils/api_utils/api_utils.dart';
import 'package:isp_management_app/utils/network_utils/network_utils.dart';

import '../model/get_billing_response_model.dart';

class BillingApi{

  Future<GetBillingResponse> getBillingService(String token, String customerId) async{
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlGetBilling(customerId);

    return await NetworkUtils().get(link, header).then((response) {
      return GetBillingResponse.fromJson(response);
    });
  }
}