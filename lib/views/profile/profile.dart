import 'package:flutter/material.dart';
import 'components/body.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("profile".tr),
      ),
      body: Body(),
    );
  }
}
