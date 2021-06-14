import 'package:app_demo_get/views/sign-in/widget/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sign_in".tr),
      ),
      body: Body(),
    );
  }
}
