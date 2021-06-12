import 'package:app_demo_get/controllers/cart-controller.dart';
import 'package:app_demo_get/controllers/home-page-controller.dart';
import 'package:app_demo_get/controllers/main-page-controller.dart';
import 'package:app_demo_get/shared/widget/common-items.dart';
import 'package:app_demo_get/views/cart/cart.dart';
import 'package:app_demo_get/views/home/widget/banner-item.dart';
import 'package:app_demo_get/views/home/widget/new-items.dart';
import 'package:app_demo_get/views/search/search.dart';
import 'package:app_demo_get/views/sign-in/sign-in.dart';
import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController homePageController = Get.put(HomePageController());
  @override
  void initState() {
    super.initState();
    homePageController.fetchNewFood();
    homePageController.fetchPopularFood();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          floatingActionButton: FloatingActionButton(
            elevation: 0,
            backgroundColor: Colors.transparent,
            onPressed: () {
              if (MainPageController.instance.token == null ||
                  MainPageController.instance.token == '')
                Get.to(SignInPage());
              else {
                CartController.instance.getCartController();
                Get.bottomSheet(Container(
                  color: Colors.white,
                  child: ShoppingCartWidget(),
                ));
              }
            },
            tooltip: 'your_cart'.tr,
            child: Badge(
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
            ),
          ),
          backgroundColor: Colors.grey.shade200,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20.h,
                ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 16.w),
                    child: GestureDetector(
                      onTap: () {
                        showSearch(context: context, delegate: DataSearch());
                      },
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: "search".tr,
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400, fontSize: 14.sp),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 20.sp,
                            color: Colors.grey.shade400,
                          ),
                          contentPadding: EdgeInsets.all(8),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CarouselSlider(
                  items: imageSliders,
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        homePageController.currentBanner.value = index;
                      }),
                ),
                SizedBox(
                  height: 20.h,
                ),
                buildHomeTittle("new_food".tr),
                SizedBox(
                  height: 16.h,
                ),
                homePageController.isLoadingNewFoods.value
                    ? Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ),
                      )
                    : Container(
                        height: 190.h,
                        child: ListView.builder(
                          itemCount: homePageController.newFoodList.length,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.only(left: 16),
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return NewItemCard(
                                newItems:
                                    homePageController.newFoodList[index]);
                          },
                        ),
                      ),
                buildHomeTittle('popular'.tr),
                SizedBox(
                  height: 16.h,
                ),
                homePageController.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ),
                      )
                    : ListView.builder(
                        itemCount: homePageController.foodList.length,
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.only(left: 16.w),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CommonItemCard(
                              nearByItems: homePageController.foodList[index]);
                        },
                      ),
              ],
            ),
          ),
        ));
  }

  buildHomeTittle(String tittle) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            tittle,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
          Text(
            "view_all".tr,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
                color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}
