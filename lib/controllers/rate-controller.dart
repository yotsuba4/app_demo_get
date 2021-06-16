import 'package:app_demo_get/apimodule/customer/api-show-rate.dart';
import 'package:app_demo_get/models/show-rate.dart';
import 'package:get/get.dart';

class RateController extends GetxController {
  static RateController instance = Get.find();
  RxList<Rate> list = <Rate>[].obs;
  RxList<ListRate> listRate = <ListRate>[].obs;
  RxBool loadingListRate = true.obs;
  void fetchRate(String foodID) async {
    var fetch = await ApiGetRate.fetchRates(foodID);
    list.clear();
    list.add(fetch);
  }

  void fetchAllRate(String foodID, String p) async {
    try {
      loadingListRate.value = true;
      var fetch = await ApiGetRate.fetchListRates(foodID, p);
      listRate.assignAll(fetch);
    } finally {
      loadingListRate.value = false;
    }
  }
}
