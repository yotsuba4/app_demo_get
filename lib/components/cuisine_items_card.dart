import 'package:app_demo_get/models/test/cuisineItems.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CuisineItemsCard extends StatefulWidget {
  final CuisineItems cuisineItems;
  CuisineItemsCard({@required this.cuisineItems});
  @override
  _CuisineItemsCardState createState() => _CuisineItemsCardState();
}

class _CuisineItemsCardState extends State<CuisineItemsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            child: Image.asset(
              widget.cuisineItems.image,
              height: 80,
              width: 120,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.cuisineItems.text,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            widget.cuisineItems.secondaryText,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}
