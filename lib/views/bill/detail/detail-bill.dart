import 'package:app_demo_get/controllers/order-history-controller.dart';
import 'package:app_demo_get/models/get-bill-detail.dart';
import 'package:app_demo_get/models/order-history.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:app_demo_get/views/detailfood/food-detail.dart';
import 'package:app_demo_get/views/restaurant/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillDetaiPage extends StatelessWidget {
  final HisTran his;
  BillDetaiPage(this.his);
  @override
  Widget build(BuildContext context) {
    OrderHistoryController orderHistoryController = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "bill_detail".tr,
                          style: Helper.getTheme(context).headline5,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      height: 80,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: 80,
                              width: 80,
                              child: Image.network(
                                his.restaurant.banner,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                his.restaurant.restaurantName,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Row(
                                children: [
                                  Text(his.restaurant.phone),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(his.restaurant.email),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 15,
                                    child: Image.asset(
                                      Helper.getAssetName(
                                        "loc.png",
                                        "virtual",
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width: 250,
                                    child: Text(
                                      his.restaurant.adress,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    color: Color(0xFFF2F2F2),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: orderHistoryController.listItemBill
                            .map((element) => buildItem(element, false))
                            .toList(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xFFB6B7B7).withOpacity(0.25),
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "payment_method".tr,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.payment,
                                    color: AppColor.primary,
                                  ),
                                  Text(
                                    his.payment ? 'MOMO' : 'Tiền mặt',
                                    style: TextStyle(
                                      color: AppColor.primary,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Total",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            Text(
                              his.total.toString() + 'đ',
                              style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)
                                  .copyWith(
                                color: AppColor.primary,
                                fontSize: 22,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: AppColor.primary),
                            onPressed: () {
                              if (his.status == 'đang xử lý') {
                                orderHistoryController.cancelBill(his.sId);
                              } else {
                                Get.to(RestaurantPage(his.restaurant));
                              }
                            },
                            child: Text(his.status == 'đang xử lý'
                                ? 'cancel'.tr
                                : 're_order'.tr),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildItem(BillDetail bill, bool isLast) {
  return Container(
    height: 50,
    decoration: BoxDecoration(
      border: Border(
        bottom: isLast
            ? BorderSide.none
            : BorderSide(
                color: Color(0xFFB6B7B7).withOpacity(0.25),
              ),
      ),
    ),
    child: Row(
      children: [
        Expanded(
          child: Text(
            "${bill.food.foodName} x${bill.amount}",
            style: TextStyle(
              color: Color(0xFF4A4B4D),
              fontSize: 16,
            ),
          ),
        ),
        Text(
          (bill.amount * bill.food.price).toString(),
          style: TextStyle(
            color: Color(0xFF4A4B4D),
            fontSize: 16,
            fontWeight: FontWeight.w900,
          ),
        )
      ],
    ),
  );
}

class BurgerCard extends StatelessWidget {
  const BurgerCard({
    Key key,
    String name,
    String price,
    bool isLast = false,
  })  : _name = name,
        _price = price,
        _isLast = isLast,
        super(key: key);

  final String _name;
  final String _price;
  final bool _isLast;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: _isLast
              ? BorderSide.none
              : BorderSide(
                  color: Color(0xFFB6B7B7).withOpacity(0.25),
                ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "${_name} x1",
              style: TextStyle(
                color: Color(0xFF4A4B4D),
                fontSize: 16,
              ),
            ),
          ),
          Text(
            "\$$_price",
            style: TextStyle(
              color: Color(0xFF4A4B4D),
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          )
        ],
      ),
    );
  }
}
