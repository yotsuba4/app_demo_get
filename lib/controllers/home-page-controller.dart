import 'package:app_demo_get/apimodule/customer/api-new-foods.dart';
import 'package:app_demo_get/apimodule/customer/api-popular.dart';
import 'package:app_demo_get/models/object/food-object.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  static HomePageController instance = Get.find();
  var isLoadingNewFoods = true.obs;
  var newFoodList = <Foods>[].obs;
  var isLoading = true.obs;
  var foodList = <Foods>[].obs;
  RxInt currentBanner = 0.obs;
  void fetchNewFood() async {
    try {
      isLoadingNewFoods(true);
      var foods = await ApiNewFoods.fetchNewFoods();
      if (foods != null) {
        newFoodList.assignAll(foods);
      }
    } finally {
      isLoadingNewFoods(false);
    }
  }

  void fetchPopularFood() async {
    try {
      isLoading(true);
      var foods = await ApiPopuLarFood.fetchPopularFoods();
      if (foods != null) {
        foodList.assignAll(foods);
      }
    } finally {
      isLoading(false);
    }
  }
}
