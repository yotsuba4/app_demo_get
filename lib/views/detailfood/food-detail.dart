import 'package:app_demo_get/controllers/rate-controller.dart';
import 'package:app_demo_get/controllers/restaurant-controller.dart';
import 'package:app_demo_get/models/object/food-object.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:app_demo_get/views/detailfood/widget/add-to-cart.dart';
import 'package:app_demo_get/views/restaurant/restaurant.dart';
import 'package:app_demo_get/views/review/review.dart';
import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DetailsScreen extends StatefulWidget {
  final Foods food;
  DetailsScreen(this.food);
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  RateController rateController = Get.put(RateController());
  @override
  void initState() {
    super.initState();
    print('copy cái này nè, nó ở trang detail food: ${widget.food.sId}');
    RestaurantCotroller.instance.getMenu(widget.food.restaurant.sId);
    rateController.fetchRate(widget.food.sId);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: Helper.getScreenHeight(context) * 0.6,
                          width: Helper.getScreenWidth(context),
                          child: Image.network(
                            widget.food.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: Helper.getScreenHeight(context) * 0.4,
                          width: Helper.getScreenWidth(context),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.0, 0.4],
                              colors: [
                                Colors.black.withOpacity(0.9),
                                Colors.black.withOpacity(0.0),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SafeArea(
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Icon(
                                      Icons.arrow_back_ios_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    padding: EdgeInsets.only(top: 3),
                                    child: Icon(
                                      Icons.rate_review,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Helper.getScreenHeight(context) * 0.35,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 30),
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(40),
                                            topRight: Radius.circular(40),
                                          ),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Text(
                                              widget.food.foodName,
                                              style: Helper.getTheme(context)
                                                  .headline5,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SmoothStarRating(
                                                      size: 16,
                                                      allowHalfRating: false,
                                                      color: AppColor.primary,
                                                      borderColor:
                                                          AppColor.primary,
                                                      isReadOnly: true,
                                                      rating: widget.food.rate
                                                          .toDouble(),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      widget.food.rate
                                                              .toString() +
                                                          ' ' +
                                                          'star_ratings'.tr,
                                                      style: TextStyle(
                                                        color: AppColor.primary,
                                                        fontSize: 12,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Text(
                                                        (widget.food.price ~/
                                                                    1000)
                                                                .toString() +
                                                            'K',
                                                        style: TextStyle(
                                                          fontSize: 30,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      Text("/" +
                                                          "per_portion".tr)
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Text("description".tr,
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Text(widget.food.caption),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Divider(
                                              thickness: 1.5,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Row(
                                              children: [
                                                Text("same_food".tr,
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                Expanded(child: SizedBox()),
                                                InkWell(
                                                    onTap: () {
                                                      Get.to(
                                                        RestaurantPage(widget
                                                            .food.restaurant),
                                                      );
                                                    },
                                                    child: Icon(
                                                        Icons.arrow_forward))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: 165.h,
                                            child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (builder, index) {
                                                  return buildSameFoods(
                                                      RestaurantCotroller
                                                          .instance.menu[index],
                                                      widget.food.restaurant
                                                          .restaurantName);
                                                },
                                                itemCount: RestaurantCotroller
                                                    .instance.menu.length),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Divider(
                                              thickness: 1.5,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Row(
                                              children: [
                                                Text("ratings_and_reviews".tr,
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                Expanded(child: SizedBox()),
                                                InkWell(
                                                    onTap: () {
                                                      Get.to(ReviewPage(
                                                          widget.food));
                                                    },
                                                    child: Icon(
                                                        Icons.arrow_forward))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 10,
                                                right: 30,
                                                bottom: 30),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        widget.food.rate
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 50,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Colors.black87),
                                                      ),
                                                      SmoothStarRating(
                                                        allowHalfRating: false,
                                                        color: AppColor.primary,
                                                        rating: widget.food.rate
                                                            .toDouble(),
                                                        isReadOnly: true,
                                                        borderColor:
                                                            AppColor.primary,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: rateController
                                                          .list.isEmpty
                                                      ? Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        )
                                                      : Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            LinearPercentIndicator(
                                                              lineHeight: 10.0,
                                                              percent: rateController
                                                                  .list[0]
                                                                  .percentVote5
                                                                  .toDouble(),
                                                              leading:
                                                                  Text('5  '),
                                                              linearStrokeCap:
                                                                  LinearStrokeCap
                                                                      .roundAll,
                                                              backgroundColor:
                                                                  Colors.grey[
                                                                      300],
                                                              progressColor:
                                                                  AppColor
                                                                      .primary,
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            LinearPercentIndicator(
                                                              lineHeight: 10.0,
                                                              percent: rateController
                                                                  .list[0]
                                                                  .percentVote4
                                                                  .toDouble(),
                                                              leading:
                                                                  Text('4  '),
                                                              linearStrokeCap:
                                                                  LinearStrokeCap
                                                                      .roundAll,
                                                              backgroundColor:
                                                                  Colors.grey[
                                                                      300],
                                                              progressColor:
                                                                  AppColor
                                                                      .primary,
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            LinearPercentIndicator(
                                                              lineHeight: 10.0,
                                                              percent: rateController
                                                                  .list[0]
                                                                  .percentVote3
                                                                  .toDouble(),
                                                              leading:
                                                                  Text('3  '),
                                                              linearStrokeCap:
                                                                  LinearStrokeCap
                                                                      .roundAll,
                                                              backgroundColor:
                                                                  Colors.grey[
                                                                      300],
                                                              progressColor:
                                                                  AppColor
                                                                      .primary,
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            LinearPercentIndicator(
                                                              lineHeight: 10.0,
                                                              percent: rateController
                                                                  .list[0]
                                                                  .percentVote2
                                                                  .toDouble(),
                                                              leading:
                                                                  Text('2  '),
                                                              linearStrokeCap:
                                                                  LinearStrokeCap
                                                                      .roundAll,
                                                              backgroundColor:
                                                                  Colors.grey[
                                                                      300],
                                                              progressColor:
                                                                  AppColor
                                                                      .primary,
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            LinearPercentIndicator(
                                                              lineHeight: 10.0,
                                                              percent: rateController
                                                                  .list[0]
                                                                  .percentVote1
                                                                  .toDouble(),
                                                              leading:
                                                                  Text('1  '),
                                                              linearStrokeCap:
                                                                  LinearStrokeCap
                                                                      .roundAll,
                                                              backgroundColor:
                                                                  Colors.grey[
                                                                      300],
                                                              progressColor:
                                                                  AppColor
                                                                      .primary,
                                                            ),
                                                          ],
                                                        ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Column(
                                              children: [],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Divider(
                                              thickness: 1.5,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          AddToCartComponent(widget.food.price,
                                              widget.food.sId)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 20,
                                    ),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: ClipShadow(
                                        clipper: CustomTriangle(),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xFFB6B7B7),
                                            offset: Offset(0, 5),
                                            blurRadius: 5,
                                          ),
                                        ],
                                        child: Container(
                                          width: 60,
                                          height: 60,
                                          color: Colors.white,
                                          child: Image.asset(
                                            Helper.getAssetName(
                                              "fav_filled.png",
                                              "virtual",
                                            ),
                                            color: AppColor.primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildSameFoods(Foods food, String resName) {
    return InkWell(
      onTap: () {
        Get.to(
          RestaurantPage(widget.food.restaurant),
        );
      },
      child: Container(
        width: 95.h,
        margin: EdgeInsets.only(left: 18.w),
        child: Column(
          children: [
            Container(
              height: 95.h,
              width: 95.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7.r),
                child: Image.network(
                  food.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Text(
                    food.foodName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    resName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: Color(0xFF9a9a9a)),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '${food.price.toInt()} vnđ',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.left,
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

class Helper {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static String getAssetName(String fileName, String type) {
    return "assets/images/$type/$fileName";
  }

  static TextTheme getTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }
}

class CustomTriangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset controlpoint = Offset(size.width * 0, size.height * 0.5);
    Offset endpoint = Offset(size.width * 0.2, size.height * 0.85);
    Offset controlpoint2 = Offset(size.width * 0.33, size.height);
    Offset endpoint2 = Offset(size.width * 0.6, size.height * 0.9);
    Offset controlpoint3 = Offset(size.width * 1.4, size.height * 0.5);
    Offset endpoint3 = Offset(size.width * 0.6, size.height * 0.1);
    Offset controlpoint4 = Offset(size.width * 0.33, size.height * 0);
    Offset endpoint4 = Offset(size.width * 0.2, size.height * 0.15);

    Path path = new Path()
      ..moveTo(size.width * 0.2, size.height * 0.15)
      ..quadraticBezierTo(
        controlpoint.dx,
        controlpoint.dy,
        endpoint.dx,
        endpoint.dy,
      )
      ..quadraticBezierTo(
        controlpoint2.dx,
        controlpoint2.dy,
        endpoint2.dx,
        endpoint2.dy,
      )
      ..quadraticBezierTo(
        controlpoint3.dx,
        controlpoint3.dy,
        endpoint3.dx,
        endpoint3.dy,
      )
      ..quadraticBezierTo(
        controlpoint4.dx,
        controlpoint4.dy,
        endpoint4.dx,
        endpoint4.dy,
      );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
