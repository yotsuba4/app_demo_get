import 'package:app_demo_get/controllers/cart-controller.dart';
import 'package:app_demo_get/spref/constain.dart';
import 'package:app_demo_get/spref/spref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "personal_information".tr,
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "order_history".tr,
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "setting".tr,
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "help".tr,
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "log_out".tr,
            icon: "assets/icons/Log out.svg",
            press: () {
              SPref.set(SPrefCache.KEY_TOKEN, '');
              CartController.instance.count.value = 0;
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
