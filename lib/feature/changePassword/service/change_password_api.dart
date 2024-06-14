import '../../../utils/api_utils/api_utils.dart';
import '../../../utils/network_utils/network_utils.dart';
import '../model/change_password_model.dart';
import '../model/change_password_response_model.dart';

class ChangePasswordApi {
  Future<ChangePasswordResponse> changePasswordService (String token, String id, ChangePassword changePassword) async {
    final Map<String, String> header = ApiUtils().headerTokenForMultipart(token);
    final Uri link = ApiUtils().urlEditUser(id);
    final Map<String, String> form = changePassword.toJson();

    return await NetworkUtils().postMultiPart(link, header, form, null).then((response) async {
      return ChangePasswordResponse.fromJson(response);
    });
  }
}