import 'package:app_demo_get/components/custom-text.dart';
import 'package:app_demo_get/controllers/cart-controller.dart';
import 'package:app_demo_get/models/get-cart.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatefulWidget {
  final Cart cartItem;

  const CartItemWidget({Key key, this.cartItem}) : super(key: key);

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  int d;
  @override
  void initState() {
    super.initState();
    d = widget.cartItem.amount;
    print(d);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            widget.cartItem.food.image,
            width: 80,
          ),
        ),
        Expanded(
            child: Wrap(
          direction: Axis.vertical,
          children: [
            Container(
                padding: EdgeInsets.only(left: 14),
                child: CustomText(
                  text: widget.cartItem.food.foodName,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(Icons.chevron_left),
                    onPressed: () {
                      setState(() {
                        d--;
                      });
                      CartController.instance
                          .decreaseQuantity(widget.cartItem, d);
                    }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: d <= 0 ? '0' : d.toString(),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.chevron_right),
                    onPressed: () {
                      setState(() {
                        d++;
                      });
                      CartController.instance
                          .increaseQuantity(widget.cartItem, d);
                    }),
              ],
            )
          ],
        )),
        Padding(
          padding: const EdgeInsets.all(14),
          child: CustomText(
            text: "${widget.cartItem.food.price * widget.cartItem.amount} vnd",
            size: 22,
            weight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
