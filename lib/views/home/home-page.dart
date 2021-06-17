import 'package:app_demo_get/controllers/cart-controller.dart';
import 'package:app_demo_get/controllers/find-food-controller.dart';
import 'package:app_demo_get/controllers/home-page-controller.dart';
import 'package:app_demo_get/controllers/restaurant-controller.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:app_demo_get/shared/widget/common-items.dart';
import 'package:app_demo_get/shared/widget/restaurant-card.dart';
import 'package:app_demo_get/spref/constain.dart';
import 'package:app_demo_get/spref/spref.dart';
import 'package:app_demo_get/views/cart/cart.dart';
import 'package:app_demo_get/views/detailfood/food-detail.dart';
import 'package:app_demo_get/views/home/widget/banner-item.dart';
import 'package:app_demo_get/views/home/widget/new-items.dart';
import 'package:app_demo_get/views/search/search.dart';
import 'package:app_demo_get/views/sign-in/sign-in.dart';
import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController homePageController = Get.put(HomePageController());
  CartController cartController = Get.put(CartController());
  RestaurantCotroller restaurantCotroller = Get.put(RestaurantCotroller());
  FindFoodController findFoodController = Get.put(FindFoodController());
/*   CartController cartController = Get.put(CartController());
  FindFoodController findFoodController = Get.put(FindFoodController());
  RestaurantCotroller restaurantCotroller = Get.put(RestaurantCotroller());
  @override
  void initState() {
    super.initState();
    homePageController.fetchNewFood();
    homePageController.fetchPopularFood();
    findFoodController.fetchAllFood();
    cartController.getCartController();
  } */

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          floatingActionButton: FloatingActionButton(
            elevation: 4,
            backgroundColor: AppColor.primary,
            onPressed: () async {
              var token = await SPref.get(SPrefCache.KEY_TOKEN);
              if (token == null || token == '')
                Get.to(SignInPage());
              else {
                cartController.getCartController();
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
                        height: 210.h,
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
                buildHomeTittle("nearby".tr),
                SizedBox(
                  height: 16.h,
                ),
                restaurantCotroller.loadingResList.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        child: Column(
                          children: [
                            RestaurantCard(
                                restaurantCotroller.listRes[0],
                                restaurantCotroller.getDistance(
                                    restaurantCotroller.listRes[0].x,
                                    restaurantCotroller.listRes[0].y)),
                            RestaurantCard(
                                restaurantCotroller.listRes[1],
                                restaurantCotroller.getDistance(
                                    restaurantCotroller.listRes[1].x,
                                    restaurantCotroller.listRes[1].y)),
                            RestaurantCard(
                                restaurantCotroller.listRes[2],
                                restaurantCotroller.getDistance(
                                    restaurantCotroller.listRes[2].x,
                                    restaurantCotroller.listRes[2].y)),
                            RestaurantCard(
                                restaurantCotroller.listRes[3],
                                restaurantCotroller.getDistance(
                                    restaurantCotroller.listRes[3].x,
                                    restaurantCotroller.listRes[3].y)),
                            RestaurantCard(
                                restaurantCotroller.listRes[4],
                                restaurantCotroller.getDistance(
                                    restaurantCotroller.listRes[4].x,
                                    restaurantCotroller.listRes[4].y)),
                          ],
                        ),
                      ),
                SizedBox(
                  height: 20.h,
                ),
                buildHomeTittle('top_rate'.tr),
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
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
          ),
          Text(
            "view_all".tr,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: AppColor.primary),
          ),
        ],
      ),
    );
  }
}
