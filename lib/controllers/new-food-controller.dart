import 'package:app_demo_get/apimodule/customer/api-new-foods.dart';
import 'package:app_demo_get/models/object/food-object.dart';
import 'package:get/get.dart';

class NewFoodController extends GetxController {
  var isLoading = true.obs;
  var foodList = <Foods>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNewFood();
  }

  void fetchNewFood() async {
    try {
      isLoading(true);
      var foods = await ApiNewFoods.fetchNewFoods();
      if (foods != null) {
        foodList.assignAll(foods);
      }
    } finally {
      isLoading(false);
    }
  }
}
