import 'package:app_demo_get/components/default-button.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:app_demo_get/shared/form-error.dart';
import 'package:app_demo_get/size_config.dart';
import 'package:flutter/material.dart';

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
                "OTP Verification",
                style: headingStyle,
              ),
              Text("We sent your code to +1 898 860 ***"),
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
                                        hintText: 'Nhập lại email'),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  DefaultButton(
                                    text: 'Xác nhận',
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
                  "Resend OTP Code",
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
        Text("This code will expired in "),
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
