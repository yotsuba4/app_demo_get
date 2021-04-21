import 'package:app_demo_get/shared/color.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  List<Map> drawerItems = [
    {'icon': 'assets/images/cart-icon.png', 'title': 'My Cart'},
    {'icon': 'assets/images/order-icon.png', 'title': 'My Orders'},
    {'icon': 'assets/images/profile-icon.png', 'title': 'My Profile'},
    {'icon': 'assets/images/address-icon.png', 'title': 'My Address'},
    {'icon': 'assets/images/payment-icon.png', 'title': 'Payment Method'},
    {'icon': 'assets/images/voucher-icon.png', 'title': 'My Voucher'},
    {'icon': 'assets/images/contact-icon.png', 'title': 'Contact Us'},
    {'icon': 'assets/images/setting-icon.png', 'title': 'Settings'},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primary,
      padding: EdgeInsets.only(top: 50, bottom: 70, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  child: Image.asset(
                    'assets/images/avatar-icon.png',
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jessie Tyler',
                      style: TextStyle(
                          color: AppColor.commonText,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text(
                      'jessie tyler@gmail.com',
                      style: TextStyle(
                        color: AppColor.commonText,
                        fontSize: 12,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: drawerItems
                  .map((element) => Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 30),
                        child: Row(
                          children: [
                            Image.asset(element['icon']),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              element['title'],
                              style: TextStyle(
                                  color: AppColor.commonText, fontSize: 16),
                            )
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
