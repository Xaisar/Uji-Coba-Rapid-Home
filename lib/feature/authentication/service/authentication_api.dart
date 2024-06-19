import 'dart:convert';

import '../../../utils/api_utils/api_utils.dart';
import '../../../utils/network_utils/network_utils.dart';
import '../model/logout_response_model.dart';

class AuthenticationApi {
  Future<LogoutResponse> logoutService(String token) async{
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlLogout();
    final String body = json.encode({});

    return await NetworkUtils().post(link, header, body).then((response) {
      return LogoutResponse.fromJson(response);
    });
  }
}