import 'dart:convert';

import '../../../utils/api_utils/api_utils.dart';
import '../../../utils/network_utils/network_utils.dart';
import '../model/register_model.dart';
import '../model/register_response_model.dart';

class RegisterApi{

  Future<RegisterResponse> registerService(RegisterModel registerModel) async {
    final Map<String, String> header = ApiUtils().header();
    final Uri link = ApiUtils().urlRegister();
    final String body = json.encode(registerModel.toJson());

    return await NetworkUtils().post(link, header, body).then((response) {
      return RegisterResponse.fromJson(response);
    }).catchError((dynamic onError){
      return onError;
    });
  }

}