import 'package:app_demo_get/controllers/cart-controller.dart';
import 'package:app_demo_get/models/object/food-object.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:app_demo_get/spref/constain.dart';
import 'package:app_demo_get/spref/spref.dart';
import 'package:app_demo_get/views/detailfood/food-detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

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
        Get.to(DetailsScreen(), arguments: widget.nearByItems);
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 16),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                widget.nearByItems.image,
                height: 100,
                width: 100,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.nearByItems.foodName,
                  style: TextStyle(
                      height: 1.3, fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5,
                ),
                Text('Tiệm ăn Đức Sine'),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    SmoothStarRating(
                      size: 15,
                      allowHalfRating: true,
                      color: AppColor.primary,
                      borderColor: AppColor.primary,
                      isReadOnly: true,
                      rating: widget.nearByItems.rate.toDouble(),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "${widget.nearByItems.rate}",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                    Text(
                      "(${widget.nearByItems.buys} buys)",
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
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
                          size: 20,
                        ),
                        onPressed: () async {
                          var token = await SPref.get(SPrefCache.KEY_TOKEN);
                          CartController.instance.addToCartController(
                              token, widget.nearByItems.sId, 1);
                        })
                  ],
                ),
              ],
            ),
            Expanded(
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
