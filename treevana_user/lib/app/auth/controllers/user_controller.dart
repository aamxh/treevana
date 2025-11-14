import 'package:get/get.dart';
import 'package:treevana_user/app/auth/auth_api.dart';
import 'package:treevana_user/app/auth/models/user_model.dart';

class UserController extends GetxController {

  var user = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();
    _loadUser();
  }

  Future<void> _loadUser() async {
    try {
      user.value = await AuthApi.getProfile();
    } catch (ex) {
      print("Failed to load user profile: $ex");
    }
  }

}