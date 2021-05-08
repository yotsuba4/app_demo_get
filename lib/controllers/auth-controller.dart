import 'package:app_demo_get/apimodule/auth/api-get-profile.dart';
import 'package:app_demo_get/apimodule/auth/api-login.dart';
import 'package:app_demo_get/apimodule/auth/api-sign-up.dart';
import 'package:app_demo_get/models/object/user.dart';
import 'package:app_demo_get/views/login_success/login_success_screen.dart';
import 'package:app_demo_get/views/otp/otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  void signIn(String username, String password) async {
    try {
      var check = await ApiLogin.login(username, password);
      if (check) {
        Get.offAll(LoginSuccessScreen());
      } else {
        Get.snackbar('Đăng nhập thất bại', 'Thử lại');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void signUp(String email, String username, String password) async {
    try {
      var check = await ApiSignUp.signUp(email, username, password);
      if (check) {
        Get.to(OtpPage());
      } else {
        Get.snackbar('Đăng ký thất bại', 'Thử lại');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<User> getProfile(String token) async {
    User user;
    try {
      user = await ApiGetProfile.fetchProfile(token);
    } catch (e) {
      debugPrint(e.toString());
    }
    return user;
  }
}
