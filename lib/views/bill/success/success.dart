import 'package:app_demo_get/components/default-button.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:app_demo_get/views/home/home-page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Success extends StatefulWidget {
  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            child: Image(
              image: AssetImage("images/check02.gif"),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              top: 10,
            ),
            child: Text(
              'Thành công!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Text(
              'Vui lòng chờ xác nhận',
              style: TextStyle(fontSize: 23),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: DefaultButton(
              text: 'Đồng ý',
              press: () {
                Get.to(HomePage());
              },
            ),
          )
        ],
      ),
    );
  }
}
