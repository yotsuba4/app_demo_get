import 'package:app_demo_get/shared/color.dart';
import 'package:app_demo_get/views/sign-up/sign-up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "dont_have_account".tr + "?",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () {
            Get.to(SignUpScreen());
          },
          child: Text(
            "register".tr,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: AppColor.primary),
          ),
        ),
      ],
    );
  }
}
