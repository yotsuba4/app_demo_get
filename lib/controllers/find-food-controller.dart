import 'package:app_demo_get/apimodule/customer/api-find-food.dart';
import 'package:app_demo_get/models/object/food-object.dart';
import 'package:get/get.dart';

class FindFoodController extends GetxController {
  RxList<Foods> findFoodPopuler = <Foods>[].obs;

  void fetchFoods(String key) async {
    var foods = await ApiFindFood.fetchFoods(key);
    findFoodPopuler.assignAll(foods);
  }
}
