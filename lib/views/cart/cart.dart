import 'package:app_demo_get/components/custom-btn.dart';
import 'package:app_demo_get/components/custom-text.dart';
import 'package:app_demo_get/controllers/cart-controller.dart';
import 'package:app_demo_get/views/cart/widget/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ShoppingCartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: CustomText(
                text: "Shopping Cart",
                size: 24,
                weight: FontWeight.bold,
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
                child: Obx(
                  () => CustomButton(
                      text: "Pay (\$${CartController.instance.total})",
                      onTap: () {}),
                )))
      ],
    );
  }
}
