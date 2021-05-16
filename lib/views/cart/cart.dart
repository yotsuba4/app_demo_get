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
          child: ListView.builder(
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
                              CustomText(
                                text: CartController
                                    .instance.restaurants[index].restaurantName,
                                size: 24,
                                weight: FontWeight.bold,
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
                                CartController.instance.restaurants[index].sId)
                            .toList()
                            .map((e) => CartItemWidget(
                                  cartItem: e,
                                ))
                            .toList(),
                      ),
                      CustomButton(
                          text: "Xác nhận",
                          onTap: () {
                            Navigator.pop(context);
                            Get.to(BillScreen());
                          }),
                    ],
                  ),
                );
              }),
        ));
    /* Stack(
      children: [
        ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                print('Đến trang của hàng');
              },
              child: Padding(
                padding: EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    CustomText(
                      text: "Shopping Cart",
                      size: 24,
                      weight: FontWeight.bold,
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Obx(() => Column(
                  children: CartController.instance.carts
                      .map((cartItem) => CartItemWidget(
                            cartItem: cartItem,
                          ))
                      .toList(),
                )),
          ],
        ),
        Positioned(
            bottom: 30,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(8),
              child: CustomButton(
                  text: "Xác nhận",
                  onTap: () {
                    Navigator.pop(context);
                    Get.to(BillScreen());
                  }),
            ))
      ],
    ); */
  }
}
