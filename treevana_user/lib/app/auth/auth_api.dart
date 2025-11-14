import 'dart:convert';

import 'package:treevana_user/app/auth/models/user_model.dart';
import 'package:treevana_user/core/constants.dart';
import 'package:treevana_user/core/helpers.dart';
import 'package:dio/dio.dart';

class AuthApi {

  AuthApi._();

  static final dio = Dio();

  static Future<bool> isUserAuthenticated() async {
    try {
      return true;
    } catch(ex) {
      MyHelpers.showError(ex.toString());
      return false;
    }
  }

  static Future<bool> signIn(UserModel user) async {
    try {
      final json = jsonEncode(user.toJson());
      final res = await dio.post("${MyConstants.baseUrl}api/auth/login", data: json);
      if (MyHelpers.isResOk(res.statusCode!)) {
        await saveAccessToken();
        return true;
      }
      return false;
    } catch(ex) {
      MyHelpers.showError(ex.toString());
      return false;
    }
  }

  static Future<bool> signUp(UserModel user) async {
    try {
      final json = jsonEncode(user.toJson());
      final res = await dio.post("${MyConstants.baseUrl}api/auth/register", data: json);
      if (MyHelpers.isResOk(res.statusCode!)) {
        await saveAccessToken();
        return true;
      }
      return false;
    } catch(ex) {
      MyHelpers.showError(ex.toString());
      return false;
    }
  }

  static Future<void> saveAccessToken() async {
    try {

    } catch(ex) {
      MyHelpers.showError(ex.toString());
    }
  }

}