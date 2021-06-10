import 'package:app_demo_get/components/default-button.dart';
import 'package:app_demo_get/controllers/cart-controller.dart';
import 'package:app_demo_get/shared/form-error.dart';
import 'package:app_demo_get/views/bill/momo/momo_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../size_config.dart';

class CheckoutCard extends StatefulWidget {
  const CheckoutCard({
    Key key,
  }) : super(key: key);

  @override
  _CheckoutCardState createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  @override
  void initState() {
    super.initState();
    CartController.instance.methodPayment = 'Chọn phương thức thanh toán';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                InkWell(
                    onTap: () {
                      Get.bottomSheet(Container(
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(100, 30, 30, 30),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    CartController.instance.methodPayment =
                                        'Tiền mặt';
                                  });

                                  Get.back();
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      child: Image.asset(
                                          'assets/images/money.png'),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text('Tiền mặt',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    CartController.instance.methodPayment =
                                        'MOMO';
                                  });

                                  Get.back();
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      child:
                                          Image.asset('assets/images/momo.jpg'),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text('Ví momo',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ));
                    },
                    child: Text(
                      CartController.instance.methodPayment,
                    )),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Tổng cộng:\n",
                    children: [
                      TextSpan(
                        text: CartController.instance.total.value.toString() +
                            ' vnđ',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    text: "Đặt hàng",
                    press: () {
                      if (CartController.instance.methodPayment == 'Tiền mặt')
                        CartController.instance.addToBill();
                      else {
                        Get.to(MomoPayment());
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
