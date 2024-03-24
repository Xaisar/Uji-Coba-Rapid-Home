import 'dart:convert';

import '../../../utils/api_utils/api_utils.dart';
import '../../../utils/network_utils/network_utils.dart';
import '../model/login_response_model.dart';
import '../model/validate_token_response_model.dart';
import '../model/login_model.dart';

class LoginApi{

  Future<LoginResponse> loginService(LoginModel loginModel) async {
    final Map<String, String> header = ApiUtils().header();
    final Uri link = ApiUtils().urlLogin();
    final String body = json.encode(loginModel.toJson());

    return await NetworkUtils().post(link, header, body).then((response) {
      return LoginResponse.fromJson(response);
    }).catchError((dynamic onError){
      return onError;
    });
  }

  Future<ValidateTokenResponse> validateTokenService(String token) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlValidateToken();
    final String body = json.encode({});

    return await NetworkUtils().post(link, header, body).then((response) {
      return ValidateTokenResponse.fromJson(response);
    }).catchError((dynamic onError){
      return onError;
    });
  }

}