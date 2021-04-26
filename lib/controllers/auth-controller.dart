import 'package:app_demo_get/apimodule/auth/api-login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  Rx<bool> isSuccess = false.obs;

  void signIn(String username, String password) async {
    try {
      var check = await ApiLogin.login(username, password);
      isSuccess.value = check;
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar('Sign In Failed', 'Try again');
    }
  }
}
