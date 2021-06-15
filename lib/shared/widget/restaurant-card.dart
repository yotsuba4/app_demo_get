import 'package:app_demo_get/models/object/restaurant-obj.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:app_demo_get/views/detailfood/food-detail.dart';
import 'package:app_demo_get/views/restaurant/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final double distance;
  RestaurantCard(this.restaurant, this.distance);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(RestaurantPage(restaurant));
      },
      child: SizedBox(
        height: 270.h,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(
                restaurant.banner,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        restaurant.restaurantName,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        Helper.getAssetName("star_filled.png", "virtual"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "4.9",
                        style: TextStyle(
                          color: AppColor.primary,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("(124 ratings)"),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(restaurant.adress),
                      SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          ".",
                          style: TextStyle(
                            color: AppColor.primary,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('${distance.toInt()}m'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
