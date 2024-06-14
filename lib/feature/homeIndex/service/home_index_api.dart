import '../../../utils/api_utils/api_utils.dart';
import '../../../utils/network_utils/network_utils.dart';
import '../model/get_user_response_model.dart';

class HomeIndexApi {

  Future<GetUserResponse> userService (String token, String userId ) async {
    final Map<String, String> header = ApiUtils().headerWithToken(token);
    final Uri link = ApiUtils().urlGeUser(userId);

    return await NetworkUtils().get(link, header).then((response) {
      return GetUserResponse.fromJson(response);
    }).catchError((dynamic onError){
      return onError;
    });
  }

}