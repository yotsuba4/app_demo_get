import 'package:app_demo_get/controllers/find-food-controller.dart';
import 'package:app_demo_get/models/object/food-object.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:app_demo_get/shared/func.dart';
import 'package:app_demo_get/views/detailfood/food-detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewItemCard extends StatefulWidget {
  final Foods newItems;
  NewItemCard({@required this.newItems});
  @override
  _CuisineItemsCardState createState() => _CuisineItemsCardState();
}

class _CuisineItemsCardState extends State<NewItemCard> {
  FindFoodController findFoodController = Get.put(FindFoodController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(DetailsScreen(), arguments: widget.newItems);
      },
      child: Container(
        padding: EdgeInsets.only(right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              child: Image.network(
                xuLyHttp(widget.newItems.image),
                height: 120.h,
                width: 180.w,
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(5.r),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              widget.newItems.foodName,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: <Widget>[
                SmoothStarRating(
                  size: 15.sp,
                  allowHalfRating: true,
                  color: AppColor.primary,
                  borderColor: AppColor.primary,
                  isReadOnly: true,
                  rating: widget.newItems.rate.toDouble(),
                ),
                Text(
                  ' ' + widget.newItems.rate.toString(),
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
                ),
                Text(
                  '(${widget.newItems.buys} ' + 'buys'.tr + ')',
                  style:
                      TextStyle(fontSize: 14.sp, color: Colors.grey.shade500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
