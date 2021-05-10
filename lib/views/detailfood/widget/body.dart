import 'dart:ui';

import 'package:app_demo_get/models/object/food-object.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:app_demo_get/views/detailfood/widget/relate-food.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Body extends StatelessWidget {
  final Foods food;
  final double expandedHeight = 400;
  final double roundedContainerHeight = 50;
  Body({@required this.food});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: <Widget>[
            _buildSliverHead(),
            SliverToBoxAdapter(
              child: _buildDetail(),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
          ),
          child: SizedBox(
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSliverHead() {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(
        expandeHeight: expandedHeight,
        food: food,
        roundedContainerHeight: roundedContainerHeight,
      ),
    );
  }

  Widget _buildDetail() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildFoodInfo(),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
            child: Text(
              food.caption,
              style: TextStyle(
                color: Colors.black38,
                height: 1.4,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 15,
              right: 30,
              top: 10,
              bottom: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Liên quan",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Xem tất cả",
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 120, child: RelatedWidget()),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 15,
                  ),
                  child: Text(
                    "Xếp hạng và đánh giá",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Icon(
                  Icons.info_outline,
                  size: 20,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      food.rate.toString(),
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    ),
                    SmoothStarRating(
                      allowHalfRating: true,
                      color: AppColor.primary,
                      rating: food.rate.toDouble(),
                      isReadOnly: true,
                      borderColor: AppColor.primary,
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LinearPercentIndicator(
                      width: 180,
                      lineHeight: 10.0,
                      percent: 0.5,
                      leading: Text('5  '),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      backgroundColor: Colors.grey[300],
                      progressColor: AppColor.primary,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    LinearPercentIndicator(
                      width: 180,
                      lineHeight: 10.0,
                      percent: 0,
                      leading: Text('4  '),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      backgroundColor: Colors.grey[300],
                      progressColor: AppColor.primary,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    LinearPercentIndicator(
                      width: 180,
                      lineHeight: 10.0,
                      percent: 0,
                      leading: Text('3  '),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      backgroundColor: Colors.grey[300],
                      progressColor: AppColor.primary,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    LinearPercentIndicator(
                      width: 180,
                      lineHeight: 10.0,
                      percent: 0,
                      leading: Text('2  '),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      backgroundColor: Colors.grey[300],
                      progressColor: AppColor.primary,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    LinearPercentIndicator(
                      width: 180,
                      lineHeight: 10.0,
                      percent: 0,
                      leading: Text('1  '),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      backgroundColor: Colors.grey[300],
                      progressColor: AppColor.primary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              food.image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  food.foodName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  food.restaurant.restaurantName == null
                      ? 'Quán ăn Đức sine'
                      : food.restaurant.restaurantName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            '${food.price} đ',
          ),
        ],
      ),
    );
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final Foods food;
  final double expandeHeight;
  final double roundedContainerHeight;
  DetailSliverDelegate(
      {this.expandeHeight, this.food, this.roundedContainerHeight});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Image.network(
          food.image,
          width: MediaQuery.of(context).size.width,
          height: expandeHeight,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: expandeHeight - roundedContainerHeight - shrinkOffset,
          left: 0,
          child: Container(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: SmoothStarRating(
              color: AppColor.primary,
              borderColor: AppColor.primary,
              rating: food.rate.toDouble(),
              onRated: (value) {
                print(value);
              },
              allowHalfRating: false,
              isReadOnly: false,
            ),
            width: MediaQuery.of(context).size.width,
            height: roundedContainerHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandeHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
