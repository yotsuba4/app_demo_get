import 'package:app_demo_get/controllers/cart-controller.dart';
import 'package:app_demo_get/shared/widget/common-items.dart';
import 'package:app_demo_get/controllers/new-food-controller.dart';
import 'package:app_demo_get/controllers/popular-food-controller.dart';
import 'package:app_demo_get/spref/constain.dart';
import 'package:app_demo_get/spref/spref.dart';
import 'package:app_demo_get/views/cart/cart.dart';
import 'package:app_demo_get/views/home/widget/banner-item.dart';
import 'package:app_demo_get/views/home/widget/home-title.dart';
import 'package:app_demo_get/views/home/widget/new-items.dart';
import 'package:app_demo_get/views/search/search.dart';
import 'package:app_demo_get/views/sign-in/sign-in.dart';
import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewFoodController newFoods = Get.put(NewFoodController());
  PopularFoodController popularFoodController =
      Get.put(PopularFoodController());
  @override
  void initState() {
    super.initState();
    CartController.instance.getCartController();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    int _current = 0;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
        tooltip: 'Your cart',
        child: Obx(() => Badge(
              animationDuration: Duration(milliseconds: 100),
              animationType: BadgeAnimationType.slide,
              badgeContent: Text(
                '${CartController.instance.count}',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              child: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
                size: 30,
              ),
            )),
      ),
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
                child: GestureDetector(
                  onTap: () {
                    showSearch(context: context, delegate: DataSearch());
                  },
                  child: TextField(
                    enabled: false,
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
            ),
            SizedBox(
              height: 20,
            ),
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
