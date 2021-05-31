import 'dart:ui';

import 'package:app_demo_get/controllers/find-food-controller.dart';
import 'package:app_demo_get/controllers/rate-controller.dart';
import 'package:app_demo_get/models/object/food-object.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:app_demo_get/shared/func.dart';
import 'package:app_demo_get/views/detailfood/widget/relate-food.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Body extends StatefulWidget {
  final Foods food;

  Body({@required this.food});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FindFoodController findFoodController = Get.put(FindFoodController());
  RateController rateController = Get.put(RateController());
  final double expandedHeight = 400;

  final double roundedContainerHeight = 50;

  @override
  void initState() {
    super.initState();
    var key = widget.food.foodName[0];
    //  print('Day la mon tuong tu: $key');
    findFoodController.fetchFoods(key);
    rateController.fetchRate(widget.food.sId);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
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
        ));
  }

  Widget _buildSliverHead() {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(
        expandeHeight: expandedHeight,
        food: widget.food,
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
              widget.food.caption,
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
                  "Đề xuất khác",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
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
                      widget.food.rate.toString(),
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    ),
                    SmoothStarRating(
                      allowHalfRating: false,
                      color: AppColor.primary,
                      rating: widget.food.rate.toDouble(),
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
                      percent: rateController.list[0].percentVote5.toDouble(),
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
                      percent: rateController.list[0].percentVote4.toDouble(),
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
                      percent: rateController.list[0].percentVote3.toDouble(),
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
                      percent: rateController.list[0].percentVote2.toDouble(),
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
                      percent: rateController.list[0].percentVote1.toDouble(),
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              xuLyHttp(widget.food.image),
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.food.foodName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    widget.food.restaurant.restaurantName == null
                        ? 'Quán ăn Đức sine'
                        : widget.food.restaurant.restaurantName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Text(
            '${widget.food.price} đ',
            style: TextStyle(fontSize: 20),
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
          xuLyHttp(food.image),
          width: MediaQuery.of(context).size.width,
          height: expandeHeight,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: expandeHeight - roundedContainerHeight - shrinkOffset,
          left: 0,
          child: Container(
            padding: EdgeInsets.only(left: 20, top: 20),
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
