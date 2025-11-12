import 'package:email_validator/email_validator.dart';
import 'package:treevana_user/core/constants.dart';
import 'package:get/get.dart';
import 'dart:math';

class MyHelpers {

  MyHelpers._();

  static void showError(String text) {
    Get.showSnackbar(GetSnackBar(
      message: text,
      title: 'An error occured!',
      backgroundColor: MyConstants.errorColor,
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
    if (val.length != 10 && val.isNotEmpty) return "Invalid phone number!";
    return null;
  }

  static String? validatePassword(String pass1, String pass2) {
    if (pass1.length < 6) return "Password must be at least 6 characters long!";
    if (pass1 != pass2) return "The two passwords are different!";
    return null;
  }

}