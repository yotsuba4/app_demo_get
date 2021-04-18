import 'package:app_demo_get/apimodule/api-popular.dart';
import 'package:app_demo_get/apimodule/api_service.dart';
import 'package:app_demo_get/productmodule/models/get-popular.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  var isLoading = true.obs;
  var foodList = <Food>[].obs;
  @override
  void onInit() {
    fetchPopularFood();
    super.onInit();
  }

  void fetchFoods() async {
    try {
      isLoading(true);
      var foods = await ApiService.fetchFoods();
      if (foods != null) {
        foodList.assignAll(foods);
        print(foodList[0].foodName);
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchPopularFood() async {
    try {
      isLoading(true);
      var foods = await ApiPopuLarFood.fetchPopularFoods();
      if (foods != null) {
        foodList.assignAll(foods);
        print(foodList[0].foodName);
      }
    } finally {
      isLoading(false);
    }
  }
}
