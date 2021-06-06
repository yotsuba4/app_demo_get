import 'package:app_demo_get/apimodule/auth/api-edit-account.dart';
import 'package:app_demo_get/apimodule/auth/api-get-profile.dart';
import 'package:app_demo_get/apimodule/auth/api-login.dart';
import 'package:app_demo_get/apimodule/auth/api-sign-up.dart';
import 'package:app_demo_get/models/object/user.dart';
import 'package:app_demo_get/spref/constain.dart';
import 'package:app_demo_get/spref/spref.dart';
import 'package:app_demo_get/views/login_success/login_success_screen.dart';
import 'package:app_demo_get/views/otp/otp.dart';
import 'package:app_demo_get/views/sign-in/sign-in.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  static String emailController = '';
  var isLoading = false.obs;
  var imageURL = '';
  var user = User().obs;

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

  void verificationOTP(String otp) async {
    try {
      var check = await ApiSignUp.verificationOTP(emailController, otp);
      if (check) {
        Get.off(SignInPage());
      } else {
        Get.snackbar('OTP không đúng', 'Thử lại');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getProfile() async {
    var token = await SPref.get(SPrefCache.KEY_TOKEN);
    try {
      isLoading(true);
      user.value = await ApiGetProfile.fetchProfile(token);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void uploadImage(ImageSource imageSource) async {
    try {
      final pickedFile = await ImagePicker().getImage(source: imageSource);

      if (pickedFile != null) {
        bool isUpload = await ApiEditAccount.uploadAvatar(pickedFile.path);

        if (isUpload == true) {
          getProfile();
          Get.snackbar('Thông báo', 'Cập nhật thành công ảnh đại diện',
              margin: EdgeInsets.only(top: 5, left: 10, right: 10));
        } else {
          Get.snackbar('Thông báo', 'Thất bại',
              margin: EdgeInsets.only(top: 5, left: 10, right: 10));
        }
      } else {
        Get.snackbar('Thông báo', 'Chưa chọn ảnh',
            margin: EdgeInsets.only(top: 5, left: 10, right: 10));
      }
    } on DioError {
      print('Dio Error');
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
