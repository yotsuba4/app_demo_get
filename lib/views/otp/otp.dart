import 'package:app_demo_get/size_config.dart';
import 'package:app_demo_get/views/otp/components/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("otp_verification".tr),
      ),
      body: Body(),
    );
  }
}
