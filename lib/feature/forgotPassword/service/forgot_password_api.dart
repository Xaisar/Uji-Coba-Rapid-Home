import 'dart:convert';

import '../../../utils/api_utils/api_utils.dart';
import '../../../utils/network_utils/network_utils.dart';
import '../model/forgot_password_response_model.dart';

class ForgotPasswordApi {
  
  Future<ForgotPasswordResponse> forgotPasswordService(String email) async {
    final Map<String, String> header = ApiUtils().header();
    final Uri link = ApiUtils().urlResetPassword();
    final String body = json.encode(<String, dynamic>{
      "email": email
    });

    return await NetworkUtils().post(link, header, body).then((response) {
      return ForgotPasswordResponse.fromJson(response);
    });
  }
}