import 'dart:convert';

import 'package:app_demo_get/apimodule/product/api-cart.dart';
import 'package:app_demo_get/models/get-cart.dart';
import 'package:app_demo_get/models/object/restaurant-obj.dart';
import 'package:app_demo_get/spref/constain.dart';
import 'package:app_demo_get/spref/spref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  RxInt count = 0.obs;
  RxList<Cart> carts = RxList([]);
  RxInt total = 0.obs;
  RxList<Restaurant> restaurants = RxList([]);

  increaseItem() => count++;

  void createListRes(List<Cart> list) {
    var newList = [];
    List<Restaurant> listRes = [];
    for (int i = 0; i < list.length; i++) {
      newList.add(list[i].restaurant.toJson());
    }
    final jsonList = newList.map((item) => jsonEncode(item)).toList();
    final uniqueJsonList = jsonList.toSet().toList();
    final result = uniqueJsonList.map((item) => jsonDecode(item)).toList();
    for (int i = 0; i < result.length; i++) {
      Restaurant res = Restaurant.fromJson(result[i]);
      listRes.add(res);
    }
    print(listRes.length);
    restaurants.assignAll(listRes);
  }

  void addToCartController(String token, String foodID, int amount) async {
    try {
      bool check = await ApiAddToCart.addToCart(token, foodID, amount);
      if (check == true) {
        Get.snackbar('Thông báo', 'Thêm thành công');
        increaseItem();
      } else {
        Get.snackbar('Thông báo', 'Thêm thất bại');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getCartController() async {
    var token = await SPref.get(SPrefCache.KEY_TOKEN);
    try {
      var list = await ApiAddToCart.getCart(token);
      if (list.isNotEmpty) {
        createListRes(list);
        carts.assignAll(list);
        count.value = list.length;
        totalCart();
      } else {
        Get.snackbar("Thông báo", "Không load được dữ liệu");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void increaseQuantity(Cart item) async {}

  void totalCart() {
    total.value = 0;
    if (carts.isNotEmpty) {
      carts.forEach((element) {
        total += element.food.price * element.amount;
      });
    }
  }
}
