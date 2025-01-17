import 'dart:convert';

import '../../../utils/api_utils/api_utils.dart';
import '../../../utils/network_utils/network_utils.dart';
import '../../login/model/validate_token_response_model.dart';
import '../model/add_customer_model.dart';
import '../model/add_customer_response_model.dart';
import '../model/get_merchant_response_model.dart';

class AddCustomerApi{

  Future<GetMerchantResponse> initialService(String token) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlGetAllMerchant();

    return await NetworkUtils().get(link, header).then((response) {
      return GetMerchantResponse.fromJson(response);
    });
  }

  Future<AddCustomerResponse> addCustomerService(AddCustomer addCustomer, String token) async{
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlAddCustomer();
    final String body = json.encode(addCustomer.toJson());

    return await NetworkUtils().post(link, header, body).then((response) {
      return AddCustomerResponse.fromJson(response);
    });
  }

  Future<ValidateTokenResponse> validateTokenService(String token) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlValidateToken();
    final String body = json.encode({});

    return await NetworkUtils().post(link, header, body).then((response) {
      return ValidateTokenResponse.fromJson(response);
    });
  }
}