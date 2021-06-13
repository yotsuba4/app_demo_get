import 'package:app_demo_get/controllers/cart-controller.dart';
import 'package:app_demo_get/models/object/food-object.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:app_demo_get/shared/func.dart';
import 'package:app_demo_get/views/detailfood/food-detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonItemCard extends StatefulWidget {
  final Foods nearByItems;
  CommonItemCard({@required this.nearByItems});
  @override
  _NearByItemsCardState createState() => _NearByItemsCardState();
}

class _NearByItemsCardState extends State<CommonItemCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(DetailsScreen(widget.nearByItems));
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 16.h),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: Image.network(
                xuLyHttp(widget.nearByItems.image),
                height: 110.w,
                width: 110.w,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 200.w,
                  child: Text(
                    widget.nearByItems.foodName,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        height: 1.3.h,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(widget.nearByItems.restaurant.restaurantName,
                    style: TextStyle(fontSize: 14.sp)),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: <Widget>[
                    SmoothStarRating(
                      size: 15.sp,
                      allowHalfRating: true,
                      color: AppColor.primary,
                      borderColor: AppColor.primary,
                      isReadOnly: true,
                      rating: widget.nearByItems.rate.toDouble(),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      "${widget.nearByItems.rate}",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 12.sp),
                    ),
                    Text(
                      '(${widget.nearByItems.buys} ' + 'buys'.tr + ')',
                      style: TextStyle(
                          fontSize: 12.sp, color: Colors.grey.shade500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Text(
                      '${widget.nearByItems.price} đ',
                      style: TextStyle(color: Colors.red),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.add_shopping_cart,
                          size: 20.sp,
                        ),
                        onPressed: () {
                          CartController.instance
                              .addToCartController(widget.nearByItems.sId, 1);
                        })
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
