import 'package:app_demo_get/views/detailfood/widget/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        food: Get.arguments,
      ),
    );
  }
}
