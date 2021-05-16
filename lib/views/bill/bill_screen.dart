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
            '8 items',
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
