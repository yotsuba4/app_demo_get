import 'package:app_demo_get/apimodule/product/api-cart.dart';
import 'package:app_demo_get/models/get-cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  RxInt count = 0.obs;
  RxList<Cart> carts = RxList([]);
  RxInt total = 0.obs;

  increaseItem() => count++;

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

  void getCartController(String token) async {
    try {
      var list = await ApiAddToCart.getCart(token);
      if (list.isNotEmpty) {
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
    if (carts.isNotEmpty) {
      carts.forEach((element) {
        total += element.food.price * element.amount;
      });
    }
  }
}