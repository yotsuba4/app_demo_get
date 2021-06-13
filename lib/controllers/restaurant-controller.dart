import 'package:app_demo_get/apimodule/customer/api-get-menu.dart';
import 'package:app_demo_get/models/object/food-object.dart';
import 'package:get/get.dart';

class RestaurantCotroller extends GetxController {
  static RestaurantCotroller instance = Get.find();
  RxList<Foods> menu = <Foods>[].obs;
  RxBool loading = true.obs;
  void getMenu(String resID) async {
    try {
      loading(true);
      var list = await ApiGetMenu.getMenu(resID);
      menu.assignAll(list);
    } finally {
      loading(false);
    }
  }
}
