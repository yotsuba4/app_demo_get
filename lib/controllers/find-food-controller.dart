import 'package:app_demo_get/apimodule/customer/api-find-food.dart';
import 'package:app_demo_get/models/object/food-object.dart';
import 'package:get/get.dart';

class FindFoodController extends GetxController {
  var findFoodPopuler = <Foods>[].obs;

  void fetchFoods(String key) async {
    var foods = await ApiFindFood.fetchFoods(key);
    print(foods[0].foodName);
    findFoodPopuler.assignAll(foods);

    update();
  }
}
