import 'package:app_demo_get/shared/widget/common-items.dart';
import 'package:app_demo_get/controllers/new-food-controller.dart';
import 'package:app_demo_get/controllers/popular-food-controller.dart';
import 'package:app_demo_get/models/test/nearbyItems.dart';
import 'package:app_demo_get/views/home/widget/banner-item.dart';
import 'package:app_demo_get/views/home/widget/home-title.dart';
import 'package:app_demo_get/views/home/widget/new-items.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewFoodController newFoods = Get.put(NewFoodController());
  PopularFoodController popularFoodController =
      Get.put(PopularFoodController());

  List<NearByItems> nearbyItems = [
    NearByItems(
        text: "Sotto || Ponte Pizza\nPasta Tradizionali",
        image: "images/ponte_pizza.jpeg"),
    NearByItems(
        text: "Delicious Pizza & Pasta\nTraditionaly",
        image: "images/delicious.jpeg"),
    NearByItems(
        text: "Delicious Pizza & Pasta\nTraditionaly",
        image: "images/delicious.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    int _current = 0;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Tìm kiếm",
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.grey.shade400,
                    ),
                    contentPadding: EdgeInsets.all(8),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            /*  HomeTitle(text: "Cuisine"),
            SizedBox(
              height: 16,
            ), 
            Container(
              height: 150,
              child: ListView.builder(
                itemCount: cuisineItems.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16),
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return CuisineItemsCard(cuisineItems: cuisineItems[index]);
                },
              ),
            ),*/
            CarouselSlider(
              items: imageSliders,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            HomeTitle(text: "Món mới"),
            SizedBox(
              height: 16,
            ),
            Obx(() {
              return Container(
                height: 200,
                child: ListView.builder(
                  itemCount: newFoods.foodList.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 16),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return NewItemCard(newItems: newFoods.foodList[index]);
                  },
                ),
              );
            }),
            SizedBox(
              height: 20,
            ),
            HomeTitle(text: "Thịnh hành"),
            SizedBox(
              height: 16,
            ),
            ListView.builder(
              itemCount: popularFoodController.foodList.length,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(left: 16),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return CommonItemCard(
                    nearByItems: popularFoodController.foodList[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
