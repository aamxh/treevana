import 'package:get/get.dart';
import 'package:treevana_seller/app/common/models/user_model.dart';

class SignUpController extends GetxController {

  final Rx<UserModel> user = UserModel(
    name: '',
    email: '',
    password: '',
    phone: '',
  ).obs;

}