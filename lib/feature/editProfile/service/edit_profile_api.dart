import 'package:image_picker/image_picker.dart';

import '../../../utils/api_utils/api_utils.dart';
import '../../../utils/network_utils/network_utils.dart';
import '../model/edit_profile_response_model.dart';
import '../model/edit_user_model.dart';

class EditProfileApi {

  Future<EditProfileResponse> editProfileService (String token, String id, EditUser editUser, XFile? file) async {
    final Map<String, String> header = ApiUtils().headerTokenForMultipart(token);
    final Uri link = ApiUtils().urlEditUser(id);
    final Map<String, String> form = editUser.toJson();
    final XFile? avatar = file;

    return await NetworkUtils().postMultiPart(link, header, form, avatar).then((response) {
      return EditProfileResponse.fromJson(response);
    });
  }
}