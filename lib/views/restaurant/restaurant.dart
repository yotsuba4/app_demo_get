import 'package:app_demo_get/controllers/cart-controller.dart';
import 'package:app_demo_get/controllers/restaurant-controller.dart';
import 'package:app_demo_get/models/object/food-object.dart';
import 'package:app_demo_get/models/object/restaurant-obj.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:app_demo_get/spref/constain.dart';
import 'package:app_demo_get/spref/spref.dart';
import 'package:app_demo_get/views/cart/cart.dart';
import 'package:app_demo_get/views/sign-in/sign-in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class RestaurantPage extends StatefulWidget {
  final Restaurant restaurant;
  RestaurantPage(this.restaurant);
  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  void initState() {
    super.initState();
    RestaurantCotroller.instance.getMenu(widget.restaurant.sId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        backgroundColor: AppColor.primary,
        onPressed: () async {
          var token = await SPref.get(SPrefCache.KEY_TOKEN);
          if (token == null || token == '')
            Get.to(SignInPage());
          else {
            CartController.instance.getCartController();
            showBarModalBottomSheet(
              context: context,
              builder: (context) => Container(
                color: Colors.white,
                child: ShoppingCartWidget(),
              ),
            );
          }
        },
        tooltip: 'your_cart'.tr,
        child: Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  )),
                  child: Image.network(
                    widget.restaurant.banner,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 40.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15.0,
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.black,
                        size: 20.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                widget.restaurant.restaurantName,
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 230,
                        child: Text(
                          widget.restaurant.adress,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(fontSize: 14.0, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.2),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 7.0, right: 7.0, top: 3.0, bottom: 3.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            color: Colors.orange,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Closes in 2hrs",
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
              child: Divider(
                color: Colors.grey.withOpacity(0.2),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
              child: Container(
                height: 40.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                        child: Center(
                          child: Text(
                            "Breakfast",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                letterSpacing: 0.5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        border: new Border.all(color: AppColor.primary),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                        child: Center(
                          child: Text(
                            "Lunch",
                            style: TextStyle(
                                color: AppColor.primary,
                                fontSize: 16.0,
                                letterSpacing: 0.5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        border: new Border.all(color: AppColor.primary),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                        child: Center(
                          child: Text(
                            "Snacks",
                            style: TextStyle(
                                color: AppColor.primary,
                                fontSize: 16.0,
                                letterSpacing: 0.5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        border: new Border.all(color: AppColor.primary),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                        child: Center(
                          child: Text(
                            "Brunch",
                            style: TextStyle(
                                color: AppColor.primary,
                                fontSize: 16.0,
                                letterSpacing: 0.5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        border: new Border.all(color: AppColor.primary),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                        child: Center(
                          child: Text(
                            "Dinner",
                            style: TextStyle(
                                color: AppColor.primary,
                                fontSize: 16.0,
                                letterSpacing: 0.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: RestaurantCotroller.instance.menu
                    .map((element) => buildMenuItem(element))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(Foods food) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: MediaQuery.of(context).size.height / 4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      child: Image.network(
                        food.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.7),
                    radius: 25.0,
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 220.w,
                          child: Text(
                            food.foodName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            food.price.toString() + 'đ',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            CartController.instance
                                .addToCartController(food.sId, 1);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              border: new Border.all(color: AppColor.primary),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.add,
                                color: AppColor.primary,
                                size: 20.0,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
