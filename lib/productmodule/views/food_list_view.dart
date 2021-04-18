import 'package:app_demo_get/productmodule/controllers/food_controller.dart';
import 'package:app_demo_get/productmodule/views/widget/popular-item.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FoodController foodController = Get.put(FoodController());

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (foodController.isLoading.value)
        return Center(
          child: CircularProgressIndicator(),
        );
      else
        return /*  AnimatedContainer(
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor)
            ..rotateY(isDrawerOpen ? -0.5 : 0),
          duration: Duration(milliseconds: 250),
          decoration: BoxDecoration(
            color: AppColor.background,
            borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
          ),
          child:  */
            Material(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 77,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      isDrawerOpen
                          ? Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    xOffset = 0;
                                    yOffset = 0;
                                    scaleFactor = 1;
                                    isDrawerOpen = false;
                                  });
                                },
                                child: Image.asset('assets/images/menu.png'),
                                style: ElevatedButton.styleFrom(
                                    primary: AppColor.background, elevation: 0),
                              ),
                            )
                          : Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    xOffset = 230;
                                    yOffset = 100;
                                    scaleFactor = 0.8;
                                    isDrawerOpen = true;
                                  });
                                },
                                child: Image.asset('assets/images/menu.png'),
                                style: ElevatedButton.styleFrom(
                                    primary: AppColor.background, elevation: 0),
                              ),
                            ),
                      Container(
                        child: Text(
                          'Instant Eats',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppColor.title,
                              fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        width: 95,
                      ),
                      Image.asset('assets/images/cart.png'),
                      Image.asset('assets/images/avatar.png')
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    'What you would like \n to order?',
                    style: TextStyle(
                        color: AppColor.commonText,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(25),
                  child: Material(
                    borderRadius: BorderRadius.circular(5),
                    elevation: 5,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Container(
                            decoration: BoxDecoration(
                                color: AppColor.primary,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
                            child: Image.asset('assets/images/adjust.png')),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(
                            color: AppColor.commonText,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                            color: AppColor.title.withOpacity(0.7),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                /* Container(
                      padding: EdgeInsets.only(left: 25),
                      height: 178,
                      child: ListView.builder(
                          itemCount: listCategories.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ItemCategories(
                              label: listCategories[index].name,
                              imgUrl: listCategories[index].image,
                              isSelected: this.indexSelected == index,
                              onPressed: () async {
                                setState(() {
                                  this.indexSelected = index;
                                });
                                final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                          tit: listCategories[index].name),
                                    ));
                                if (result != null) {
                                  if (result is bool) {
                                    print("result from Details: $result");
                                  } else if (result is Category) {}
                                }
                              },
                            );
                          }),
                    ),
                    SizedBox(
                      height: 14,
                    ), */
                Container(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    "Popular",
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColor.commonText,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 25,
                    right: 25,
                  ),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: foodController.foodList.length,
                      itemBuilder: (context, index) {
                        return PopularFoods(
                          resName: foodController
                              .foodList[index].restaurant.restaurantName,
                          imgUrl: foodController.foodList[index].image,
                          title: foodController.foodList[index].foodName,
                          price: foodController.foodList[index].price,
                          rating: foodController.foodList[index].rate,
                        );
                      }),
                )
              ],
            ),
          ),
        );
      //    );
    });
  }
}
