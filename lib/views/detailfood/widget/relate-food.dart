import 'package:app_demo_get/controllers/find-food-controller.dart';
import 'package:app_demo_get/shared/func.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RelatedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FindFoodController findFoodController = Get.put(FindFoodController());
    return Obx(() => ListView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              width: 120,
              margin: EdgeInsets.only(
                right: 15,
              ),
              child: Image.network(
                xuLyHttp(findFoodController.findFoodPopuler[index].image),
                fit: BoxFit.cover,
              ),
            );
          },
          itemCount: findFoodController.findFoodPopuler.length,
        ));
  }
}
