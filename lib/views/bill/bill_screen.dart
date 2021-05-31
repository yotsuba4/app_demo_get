import 'package:app_demo_get/controllers/cart-controller.dart';
import 'package:app_demo_get/models/object/restaurant-obj.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class BillScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    Restaurant restaurant = Get.arguments;
    int item = CartController.instance.cartByRes.length;
    return AppBar(
      title: Column(
        children: [
          Text(
            restaurant.restaurantName,
            style: TextStyle(color: Colors.black),
          ),
          Text(
            '$item sản phẩm',
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
      leading: InkWell(
        onTap: () {
          CartController.instance.deleteBill(CartController.instance.bill.sId);
          Get.back();
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
