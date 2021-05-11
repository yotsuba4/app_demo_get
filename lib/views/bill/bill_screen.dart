import 'package:app_demo_get/controllers/cart-controller.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class BillScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            '${CartController.instance.carts.length} items',
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
