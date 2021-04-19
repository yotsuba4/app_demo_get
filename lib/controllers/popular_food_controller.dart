import 'package:app_demo_get/apimodule/api-popular.dart';
import 'package:app_demo_get/models/object/food-object.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  var isLoading = true.obs;
  var foodList = <Food>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPopularFood();
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
