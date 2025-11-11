import 'package:treevana_user/core/helpers.dart';
import 'package:dio/dio.dart';
import 'package:treevana_user/core/helpers.dart';

class AuthApi {

  AuthApi._();

  final dio = Dio();

  static Future<bool> isUserAuthenticated() async {
    try {
      return true;
    } catch(ex) {
      MyHelpers.showError(ex.toString());
      return false;
    }
  }

  static Future<bool> signIn() async {
    try {
      return true;
    } catch(ex) {
      MyHelpers.showError(ex.toString());
      return false;
    }
  }

  static Future<bool> signUp() async {
    try {
      return true;
    } catch(ex) {
      MyHelpers.showError(ex.toString());
      return false;
    }
  }

}