import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:treevana_user/app/auth/controllers/sign_up_controller.dart';
import 'package:treevana_user/app/common/models/user_model.dart';
import 'package:treevana_user/core/constants.dart';
import 'package:treevana_user/core/helpers.dart';
import 'package:dio/dio.dart';

class AuthApi {

  AuthApi._();

  static final dio = Dio();

  static Future<bool> isUserAuthenticated() async {
    if (!await isTokenValid()) return false;
    return (await getProfile()) != null;
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

  static Future<void> saveAccessToken(
      String accessToken,
      DateTime expiryDate,
      ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', accessToken);
    await prefs.setString('token_expiry', expiryDate.toIso8601String());
  }

  static Future<bool> tryRefreshToken() async {
    return false;
  }

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  static Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final res = await dio.post(
        "${MyConstants.baseUrl}api/auth/login",
        data: {"email": email, "password": password},
      );
      if (MyHelpers.isResOk(res.statusCode!)) {
        await saveAccessToken(
          res.data['token'],
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

  static Future<bool> signUp() async {
    final user = Get.find<SignUpController>().user.value;
    try {
      final res = await dio.post(
        "${MyConstants.baseUrl}api/auth/register",
        data: {
          "name": user.name,
          "email": user.email,
          "password": user.password,
          "phone": user.phone,
          "role": "user",
        },
      );
      if (MyHelpers.isResOk(res.statusCode!)) {
        await saveAccessToken(
          res.data['token'],
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
    try {
      final token = await getAccessToken();
      final response = await dio.post(
        "${MyConstants.baseUrl}api/auth/logout",
        options: Options(
          headers: token == null ? null : {'Authorization': 'Bearer $token'},
        ),
      );
      bool result = MyHelpers.isResOk(response.statusCode!);
      final refs = await SharedPreferences.getInstance();
      result = result & await refs.remove('access_token');
      result = result & await refs.remove('refresh_token');
      result = result & await refs.remove('token_expiry');
      return result;
    } catch (ex) {
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

  static Future<UserModel?> getProfile() async {
    try {
      final token = await getAccessToken();
      if (token == null) return null;
      final res = await dio.get(
        "${MyConstants.baseUrl}api/auth/me",
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (MyHelpers.isResOk(res.statusCode!)) {
        return UserModel.fromJson(res.data['user']);
      }
      return null;
    } catch(ex) {
      print(ex);
      return null;
    }
  }

}