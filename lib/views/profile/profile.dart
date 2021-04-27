import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Body(
        user: Get.arguments,
      ),
    );
  }
}
