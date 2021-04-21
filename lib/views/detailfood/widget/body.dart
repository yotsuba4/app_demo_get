import 'package:app_demo_get/models/object/food-object.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:app_demo_get/views/detailfood/widget/relate_food.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Body extends StatelessWidget {
  final Food food;
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
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Liên quan",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 1.6,
                  ),
                ),
                Text(
                  "Xem tất cả",
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 120, child: RelatedWidget()),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
            child: Text(
              "Đây là bình luận đánh giá",
              style: TextStyle(
                color: Colors.black38,
                height: 1.4,
                fontSize: 14,
              ),
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
                  food.restaurant.restaurantName,
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
  final Food food;
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
