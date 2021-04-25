import 'package:app_demo_get/models/object/food-object.dart';
import 'package:app_demo_get/views/detailfood/food-detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 12,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star,
                      size: 12,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star,
                      size: 12,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star,
                      size: 12,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star,
                      size: 12,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "4.3 ",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                    Text(
                      "(28 reviews)",
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
