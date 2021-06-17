import 'package:app_demo_get/apimodule/customer/api-find-food.dart';
import 'package:app_demo_get/models/object/food-object.dart';
import 'package:get/get.dart';

class FindFoodController extends GetxController {
  RxList<Foods> findFoodPopuler = <Foods>[].obs;
  List<String> suggests = [];
  List<String> recents = [];
  @override
  void onInit() {
    super.onInit();
    fetchAllFood();
  }

  void fetchAllFood() async {
    suggests.clear();
    var foods = await ApiFindFood.fetchAllFoods();
    for (var i = 0; i < foods.length; i++) {
      suggests.add(foods[i].foodName);
    }
  }

  void fetchFoods(String key) async {
    var foods = await ApiFindFood.fetchFoods(key);
    findFoodPopuler.assignAll(foods);
  }
}
