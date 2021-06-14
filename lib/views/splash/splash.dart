import 'dart:io';

import 'package:app_demo_get/lang/localization-service.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:app_demo_get/views/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    config();
    Future.delayed(Duration(seconds: 3), () {
      Get.offAll(() => MainPage(),
          transition: Transition.rightToLeft,
          duration: Duration(milliseconds: 500));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.background,
        body: Center(
          child: Image.asset('assets/images/spash.png'),
        ),
      ),
    );
  }

  void config() {
    String localeName = Platform.localeName;
    if (localeName.isNotEmpty) {
      print(localeName);
      String language = localeName.split('_')[0];
      print("defaultLocale $language");
      LocalizationService().changeLocale(language);
    }
  }
}
