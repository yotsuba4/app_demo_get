import 'package:app_demo_get/apimodule/customer/api-show-rate.dart';
import 'package:app_demo_get/apimodule/product/api-order-history.dart';
import 'package:app_demo_get/apimodule/product/api-rate.dart';
import 'package:app_demo_get/models/object/food-object.dart';
import 'package:app_demo_get/models/show-comment.dart';
import 'package:app_demo_get/models/show-rate.dart';
import 'package:app_demo_get/spref/constain.dart';
import 'package:app_demo_get/spref/spref.dart';
import 'package:app_demo_get/views/review/review.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RateController extends GetxController {
  static RateController instance = Get.find();
  RxList<Rate> list = <Rate>[].obs;
  RxList<ListRate> listRate = <ListRate>[].obs;
  RxBool loadingListRate = true.obs;
  RxList<Comment> listComment = <Comment>[].obs;
  RxBool loadingListComment = true.obs;
  void fetchRate(String foodID) async {
    var fetch = await ApiGetRate.fetchRates(foodID);
    list.clear();
    list.add(fetch);
  }

  void fetchAllRate(String foodID, String p) async {
    try {
      loadingListRate.value = true;
      var fetch = await ApiGetRate.fetchListRates(foodID, p);
      listRate.addAll(fetch);
    } finally {
      loadingListRate.value = false;
    }
  }

  void fetchAllComment(String foodID, String p) async {
    try {
      loadingListComment.value = true;
      var fetch = await ApiGetRate.fetchListReviews(foodID, p);
      listComment.addAll(fetch);
      print(RateController.instance.listComment.length);
    } finally {
      loadingListComment.value = false;
    }
  }

  void postRate(String foodID, int rate) async {
    var token = await SPref.get(SPrefCache.KEY_TOKEN);
    var check = await ApiRate.postRate(foodID, token, rate);
    Get.back();
    if (check) {
      Get.snackbar('Thông báo', 'Bạn đã đánh giá $rate sao cho món này');
      fetchRate(foodID);
    } else {
      Get.back();
      Get.snackbar('Thông báo', 'Bạn đã đánh giá món này rồi');
    }
  }

  void postComment(Foods food, String comment) async {
    var token = await SPref.get(SPrefCache.KEY_TOKEN);
    var check = await ApiRate.postComment(food.sId, token, comment);
    Get.back();
    if (check) {
      Get.to(ReviewPage(food));
    } else {
      Get.back();
      Get.snackbar('Thông báo', 'Thất bại');
    }
  }
}
