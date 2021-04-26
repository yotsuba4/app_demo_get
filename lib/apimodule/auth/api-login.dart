import 'package:app_demo_get/models/login.dart';
import 'package:app_demo_get/spref/constain.dart';
import 'package:app_demo_get/spref/spref.dart';
import 'package:dio/dio.dart';

class ApiLogin {
  static Future<bool> login(String username, String password) async {
    final response = await Dio().post(
        'https://kltn-foodoffer.herokuapp.com/api/user/auth/login',
        data: {
          "username": username,
          "password": password,
        });
    print(response);
    var userlogin = LoginModel.fromJson(response.data);
    print(userlogin.status);
    if (userlogin.status == "success") {
      var token = userlogin.data.token;
      //  print(token);
      SPref.set(SPrefCache.KEY_TOKEN, token);
      return true;
    }
    return false;
  }
}
