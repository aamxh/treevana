import 'package:email_validator/email_validator.dart';
import 'package:treevana_seller/app/common/controllers/user_controller.dart';
import 'package:treevana_seller/app/orders/controllers/order_controller.dart';
import 'package:treevana_seller/app/orders/controllers/orders_controller.dart';
import 'package:treevana_seller/app/products/controllers/add_product_controller.dart';
import 'package:treevana_seller/app/products/controllers/product_controller.dart';
import 'package:treevana_seller/app/products/controllers/products_controller.dart';
import 'package:treevana_seller/core/constants.dart';
import 'package:get/get.dart';
import 'dart:math';

class MyHelpers {

  MyHelpers._();

  static void showError(String text) {
    Get.showSnackbar(GetSnackBar(
      message: text,
      title: 'An error occurred!',
      backgroundColor: MyConstants.errorColor,
      isDismissible: false,
      duration: Duration(seconds: 4),
    ));
  }

  static void showSuccess(String text) {
    Get.showSnackbar(GetSnackBar(
      message: text,
      title: "Success!",
      backgroundColor: MyConstants.primaryColor,
      isDismissible: false,
      duration: Duration(seconds: 4),
    ));
  }

  static bool isResOk(int code) {
    if (code < 200 || code >= 300) return false;
    return true;
  }

  static String? validateEmail(String val) {
    if (val.isEmpty) return "Email field cannot be empty!";
    if (EmailValidator.validate(val)) return null;
    return 'Invalid email!';
  }

  static String? validatePhone(String val) {
    if (val.isEmpty) return "Phone number field cannot be empty!";
    if (val.length != 10 && val.isNotEmpty) return "Invalid phone number!";
    return null;
  }

  static String? validatePassword(String pass1, String pass2) {
    if (pass1.length < 6) return "Password must be at least 6 characters long!";
    if (pass1 != pass2) return "The two passwords are different!";
    return null;
  }

  static initializeControllers() {
    Get.put(OrdersController());
    Get.put(ProductsController());
    Get.put(ProductController());
    Get.put(OrderController());
    Get.put(UserController());
    Get.put(AddProductController());
  }

}