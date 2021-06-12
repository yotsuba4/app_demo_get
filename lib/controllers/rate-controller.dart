import 'package:app_demo_get/apimodule/customer/api-show-rate.dart';
import 'package:get/get.dart';

class RateController extends GetxController {
  static RateController instance = Get.find();
  RxList<Rate> list = <Rate>[].obs;
  void fetchRate(String foodID) async {
    var fetch = await ApiGetRate.fetchRates(foodID);
    list.clear();
    list.add(fetch);
  }
}
