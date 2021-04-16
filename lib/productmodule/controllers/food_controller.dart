import 'package:app_demo_get/apimodule/api_service.dart';
import 'package:app_demo_get/productmodule/models/find-all-food.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  var isLoading = true.obs;
  var foodList = <Food>[].obs;
  var doimaubien = false.obs;
  var color = Colors.black.obs;
  @override
  void onInit() {
    fetchFoods();
    super.onInit();
  }

  doimaucolor() => color(Colors.white);
  void doimauham() {
    doimaubien(!doimaubien());
  }

  void fetchFoods() async {
    try {
      isLoading(true);
      var foods = await ApiService.fetchFoods();
      if (foods != null) {
        /* foodList.assignAll(foods);
        print(foods[0].foodName); */
        foodList.assignAll(foods);
        print(foodList[0].foodName);
      }
    } finally {
      isLoading(false);
    }
  }
}
