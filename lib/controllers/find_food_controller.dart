import 'package:app_demo_get/apimodule/api-find-food.dart';
import 'package:app_demo_get/models/object/food-object.dart';
import 'package:get/get.dart';

class FindFoodController extends GetxController {
  var isLoading = true.obs;
  var findFoodPopuler = <Food>[].obs;
  var key = ''.obs;
  fetchFoods(String querry) async {
    key(querry);
    try {
      var foods = await ApiFindFood.fetchFoods(key.value);
      //  findFoodPopuler.clear();
      if (foods != null) {
        print(findFoodPopuler[0].foodName);
        return findFoodPopuler.assignAll(foods);
        //  findFoodPopuler.refresh();
      }
    } finally {
      isLoading(false);
    }
  }
}
