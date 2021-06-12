import 'package:app_demo_get/components/custom-btn.dart';
import 'package:app_demo_get/components/custom-text.dart';
import 'package:app_demo_get/controllers/cart-controller.dart';
import 'package:app_demo_get/views/bill/bill_screen.dart';
import 'package:app_demo_get/views/cart/widget/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ShoppingCartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          padding: EdgeInsets.all(10),
          child: CartController.instance.carts.isEmpty
              ? Center(
                  child: Text('Không có sản phẩm nào'),
                )
              : ListView.builder(
                  itemCount: CartController.instance.restaurants.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              print('Đến trang của hàng');
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomText(
                                      text: CartController.instance
                                          .restaurants[index].restaurantName,
                                      size: 24,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(Icons.chevron_right),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: CartController.instance.carts
                                .where((cartItem) =>
                                    cartItem.restaurant.sId ==
                                    CartController
                                        .instance.restaurants[index].sId)
                                .toList()
                                .map((e) => CartItemWidget(
                                      cartItem: e,
                                    ))
                                .toList(),
                          ),
                          CustomButton(
                              text: "Xác nhận",
                              onTap: () {
                                CartController.instance.getCartByRes(
                                    CartController
                                        .instance.restaurants[index].sId);
                                Navigator.pop(context);
                                Get.to(BillScreen());
                              }),
                        ],
                      ),
                    );
                  }),
        ));
  }
}
