import 'package:app_demo_get/controllers/cart-controller.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:app_demo_get/views/cart/cart.dart';
import 'package:app_demo_get/views/detailfood/food-detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AddToCartComponent extends StatefulWidget {
  final int price;
  final String foodID;
  AddToCartComponent(this.price, this.foodID);
  @override
  _AddToCartComponentState createState() => _AddToCartComponentState();
}

class _AddToCartComponentState extends State<AddToCartComponent> {
  int _amount;

  @override
  void initState() {
    super.initState();
    _amount = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text("number_of_portions".tr,
                    style: TextStyle(
                        fontSize: 18.sp, fontWeight: FontWeight.w600)),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColor.primary),
                            elevation: MaterialStateProperty.all(5.0)),
                        onPressed: () {
                          if (_amount > 1) {
                            setState(() {
                              _amount--;
                            });
                          }
                        },
                        child: Text("-"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 35,
                        width: 55,
                        decoration: ShapeDecoration(
                          shape: StadiumBorder(
                            side: BorderSide(color: AppColor.primary),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _amount.toString(),
                              style: TextStyle(
                                color: AppColor.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColor.primary),
                            elevation: MaterialStateProperty.all(5.0)),
                        onPressed: () {
                          setState(() {
                            _amount++;
                          });
                        },
                        child: Text("+"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  width: 120,
                  decoration: ShapeDecoration(
                    color: AppColor.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Container(
                      height: 160,
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                        left: 50,
                        right: 40,
                      ),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0xFFB6B7B7).withOpacity(0.3),
                            offset: Offset(0, 5),
                            blurRadius: 5,
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "total_price".tr,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "VNĐ ${widget.price * _amount}",
                            style: TextStyle(
                              color: AppColor.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: 200,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColor.primary),
                                ),
                                onPressed: () {
                                  CartController.instance.addToCartController(
                                      widget.foodID, _amount);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      Helper.getAssetName(
                                          "add_to_cart.png", "virtual"),
                                    ),
                                    Text(
                                      "add_to_cart".tr,
                                    )
                                  ],
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 20,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        CartController.instance.getCartController();
                        showBarModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            color: Colors.white,
                            child: ShoppingCartWidget(),
                          ),
                        );
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                              color: Color(0xFFB6B7B7).withOpacity(0.3),
                              offset: Offset(0, 5),
                              blurRadius: 5,
                            ),
                          ],
                          shape: CircleBorder(),
                        ),
                        child: Image.asset(
                          Helper.getAssetName("cart_filled.png", "virtual"),
                          color: AppColor.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
