import 'package:app_demo_get/components/default-button.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:app_demo_get/shared/form-error.dart';
import 'package:app_demo_get/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'otp_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController reEmailControlller = TextEditingController();
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                "otp_verification".tr,
                style: headingStyle,
              ),
              Text("sent_code".tr),
              buildTimer(),
              OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      ),
                      context: context,
                      builder: (builder) {
                        return SingleChildScrollView(
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            child: Padding(
                              padding: const EdgeInsets.all(40.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextField(
                                    controller: reEmailControlller,
                                    decoration: InputDecoration(
                                        hintText: 'enter_email_again'.tr),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  DefaultButton(
                                    text: 'confirm'.tr,
                                    press: () {
                                      print(
                                          'Email mới là: ${reEmailControlller.text}');
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Text(
                  "resend_otp_code".tr,
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("code_expired".tr),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (_, value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: AppColor.primary),
          ),
        ),
      ],
    );
  }
}
