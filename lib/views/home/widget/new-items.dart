import 'package:app_demo_get/controllers/find-food-controller.dart';
import 'package:app_demo_get/models/object/food-object.dart';
import 'package:app_demo_get/shared/func.dart';
import 'package:app_demo_get/views/detailfood/food-detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        /*   var key = widget.newItems.foodName[0];
        print('Day la mon tuong tu: $key');
        findFoodController.fetchFoods(key); */
        Get.to(DetailsScreen(), arguments: widget.newItems);
      },
      child: Container(
        padding: EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              child: Image.network(
                xuLyHttp(widget.newItems.image),
                height: 120,
                width: 200,
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.newItems.foodName,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 4,
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
                  widget.newItems.rate.toString(),
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                ),
                Text(
                  "(0 nhận xét)",
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
