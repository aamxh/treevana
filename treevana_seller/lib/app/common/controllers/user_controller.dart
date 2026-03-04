import 'package:get/get.dart';
import 'package:treevana_seller/app/auth/auth_api.dart';
import 'package:treevana_seller/app/common/models/user_model.dart';

class UserController extends GetxController {

  final Rx<UserModel> user = UserModel(
    name: '',
    email: '',
    password: '',
    phone: '',
  ).obs;

  @override
  void onInit() {
    super.onInit();
    _loadUser();
  }

  Future<void> _loadUser() async {
    try {
      final res = await AuthApi.getProfile();
      if (res == null) return;
      user.value = res;
    } catch (ex) {
      print("Failed to load user profile: $ex");
    }
  }

}