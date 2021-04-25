import 'package:app_demo_get/models/object/food-object.dart';
import 'package:flutter/material.dart';

class NewItemCard extends StatefulWidget {
  final Foods newItems;
  NewItemCard({@required this.newItems});
  @override
  _CuisineItemsCardState createState() => _CuisineItemsCardState();
}

class _CuisineItemsCardState extends State<NewItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            child: Image.network(
              widget.newItems.image,
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
                "4.3 ",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              ),
              Text(
                "(28 reviews)",
                style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
