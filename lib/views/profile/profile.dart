import 'package:app_demo_get/spref/constain.dart';
import 'package:app_demo_get/spref/spref.dart';
import 'package:app_demo_get/views/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('trang ca nhanh'),
        ),
        body: Container(
            child: ElevatedButton(
                onPressed: () {
                  SPref.set(SPrefCache.KEY_TOKEN, '');
                  Get.to(MainPage());
                },
                child: Text('Dang xuat'))));
  }
}
