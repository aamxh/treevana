import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:treevana_user/app/auth/models/user_model.dart';
import 'package:treevana_user/core/constants.dart';
import 'package:treevana_user/core/helpers.dart';
import 'package:dio/dio.dart';

class AuthApi {

  AuthApi._();

  static final dio = Dio();

  static Future<bool> isUserAuthenticated() async {
    if (await isTokenValid()) return true;
    return await tryRefreshToken();
  }

  static Future<bool> isTokenValid() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('access_token');
      final expiry = prefs.getString('token_expiry');
      if (token == null || expiry == null) return false;
      final expiryDate = DateTime.tryParse(expiry);
      if (expiryDate == null) return false;
      return DateTime.now().isBefore(expiryDate.subtract(const Duration(minutes: 1)));
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> signIn(UserModel user) async {
    try {
      final json = jsonEncode(user.toJson());
      final res = await dio.post("${MyConstants.baseUrl}api/auth/login", data: json);
      if (MyHelpers.isResOk(res.statusCode!)) {
        await saveAccessToken(
          res.data['tokens']['access'],
          res.data['tokens']['refresh'],
          DateTime.now().add(const Duration(days: 30)),
        );
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
        await saveAccessToken(
          res.data['tokens']['access'],
          res.data['tokens']['refresh'],
          DateTime.now().add(const Duration(days: 30)),
        );
        return true;
      }
      return false;
    } catch(ex) {
      MyHelpers.showError(ex.toString());
      return false;
    }
  }

  static Future<bool> signOut() async {
    bool res = true;
    try {
      final refs = await SharedPreferences.getInstance();
      res = res & await refs.remove('access_token');
      res = res & await refs.remove('refresh_token');
      res = res & await refs.remove('token_expiry');
      return res;
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  static Future<void> saveAccessToken(
      String accessToken,
      String refreshToken,
      DateTime expiryDate,
      ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', accessToken);
    await prefs.setString('refresh_token', refreshToken);
    await prefs.setString('token_expiry', expiryDate.toIso8601String());
  }

  static Future<bool> tryRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString('refresh_token');
    if (refreshToken == null) return false;
    try {
      final response = await dio.post(
        "$MyConstants.baseUrl/api/auth/token/refresh/",
        data: {'token': refreshToken},
      );
      final newAccessToken = response.data['access_token'];
      final newExpiry = DateTime.now().add(const Duration(days: 7));
      await prefs.setString('access_token', newAccessToken);
      await prefs.setString('token_expiry', newExpiry.toIso8601String());
      return true;
    } on Exception catch (ex) {
      print(ex);
      return false;
    }
  }

  static Future<void> initializeProfile(String token) async {
    try {

    } catch(ex) {
      print(ex);
    }
  }

}