import 'package:app_demo_get/apimodule/customer/api-popular.dart';
import 'package:app_demo_get/models/object/food-object.dart';
import 'package:get/get.dart';

class PopularFoodController extends GetxController {
  var isLoading = true.obs;
  var foodList = <Foods>[].obs;

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
