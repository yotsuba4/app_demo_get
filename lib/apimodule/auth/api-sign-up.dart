import 'package:app_demo_get/models/sign-up.dart';
import 'package:dio/dio.dart';

class ApiSignUp {
  static Future<bool> signUp(
      String email, String username, String password) async {
    final response = await Dio().post(
        'https://kltn-foodoffer.herokuapp.com/api/user/auth/register',
        data: {
          "username": username,
          "password": password,
          "email": email,
        });
    var signUp = SignUpResponse.fromJson(response.data);
    if (signUp.status == "success") {
      print(signUp.data.message);
      return true;
    }
    return false;
  }
}
