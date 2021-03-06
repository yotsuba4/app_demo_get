import 'dart:convert';

import 'package:app_demo_get/apimodule/product/api-bill.dart';
import 'package:app_demo_get/apimodule/product/api-cart.dart';
import 'package:app_demo_get/models/create_bill.dart';
import 'package:app_demo_get/models/get-cart.dart';
import 'package:app_demo_get/models/object/bill.dart';
import 'package:app_demo_get/models/object/restaurant-obj.dart';
import 'package:app_demo_get/spref/constain.dart';
import 'package:app_demo_get/spref/spref.dart';
import 'package:app_demo_get/views/bill/success/success.dart';
import 'package:app_demo_get/views/sign-in/sign-in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  RxBool isLoading = true.obs;
  RxInt count = 0.obs;
  RxList<Cart> carts = RxList([]);
  RxInt total = 0.obs;
  RxList<Restaurant> restaurants = RxList([]);
  RxList<Cart> cartByRes = RxList([]);
  bool removeCartByRes;
  Bill bill;
  bool deleteBillEmpty;
  List<GetBillDetail> addBill;
  RxString methodPayment = 'Chọn phương thức thanh toán'.obs;

  @override
  void onInit() {
    super.onInit();
    getCartController();
  }

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
    restaurants.assignAll(listRes);
  }

  void addToCartController(String foodID, int amount) async {
    var token = await SPref.get(SPrefCache.KEY_TOKEN);
    if (token == null || token == '') {
      Get.to(SignInPage());
    } else {
      try {
        bool check = await ApiAddToCart.addToCart(token, foodID, amount);
        if (check == true) {
          Get.snackbar('Thông báo', 'Thêm thành công');
          increaseItem();
        } else {
          Get.snackbar('Thông báo', 'Thêm thất bại, kiểm tra giỏ hàng');
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  void getCartController() async {
    var token = await SPref.get(SPrefCache.KEY_TOKEN);
    try {
      var list = await ApiAddToCart.getCart(token);
      createListRes(list);
      carts.assignAll(list);
      count.value = list.length;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getCartByRes(String resID) {
    total.value = 0;
    List<Cart> cartByResID = [];

    for (var i = 0; i < carts.length; i++) {
      if (carts[i].food.resID == resID) {
        cartByResID.add(carts[i]);
      }
    }
    cartByRes.assignAll(cartByResID);
    totalCart();
  }

  void increaseQuantity(Cart item, int d) async {
    try {
      isLoading(true);
      var token = await SPref.get(SPrefCache.KEY_TOKEN);
      var isIncrease = await ApiAddToCart.updateCart(token, item.food.sId, d);
      if (isIncrease) {
        getCartController();
        print('Update susscess');
      } else {
        Get.snackbar('Thông báo', 'Đã xảy ra lỗi');
      }
    } finally {
      isLoading(false);
    }
  }

  void decreaseQuantity(Cart item, int d) async {
    try {
      isLoading(true);
      var token = await SPref.get(SPrefCache.KEY_TOKEN);
      var isIncrease = await ApiAddToCart.updateCart(token, item.food.sId, d);
      if (isIncrease) {
        getCartController();
        print('Update susscess');
      } else {
        Get.snackbar('Thông báo', 'Đã xảy ra lỗi');
      }
    } finally {
      isLoading(false);
    }
  }

  void totalCart() {
    if (cartByRes.isNotEmpty) {
      cartByRes.forEach((element) {
        total += element.food.price * element.amount;
      });
    }
  }

  bool isExistItem(String foodID) {
    // getCartController(); bị chậm
    int d = 0;
    for (var i = 0; i < carts.length; i++) {
      if (carts[i].food.sId == foodID) {
        d++;
      }
    }
    if (d > 0)
      return true;
    else
      return false;
  }

  void deleteBill(String billID) async {
    var token = await SPref.get(SPrefCache.KEY_TOKEN);
    try {
      deleteBillEmpty = await ApiBill.deleteBill(billID, token);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void order(
    String restaurantID,
    bool payMethod,
    String code,
  ) async {
    var token = await SPref.get(SPrefCache.KEY_TOKEN);

    var listFoodID = cartByRes.map((element) => element.food.sId).toList();
    var listAmountID =
        cartByRes.map((element) => element.amount.toString()).toList();

    try {
      addBill = await ApiBill.createBill(
          restaurantID, payMethod, code, listFoodID, listAmountID, token);
      if (addBill.length > 0) {
        CartController.instance.removeCart();
        Get.to(Success());
      } else {
        Get.snackbar('Thông báo', 'Thất bại');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void removeCart() async {
    var token = await SPref.get(SPrefCache.KEY_TOKEN);

    var listCartID = cartByRes.map((element) => element.sId).toList();

    removeCartByRes = false;

    try {
      removeCartByRes = await ApiAddToCart.removeCart(token, listCartID);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
