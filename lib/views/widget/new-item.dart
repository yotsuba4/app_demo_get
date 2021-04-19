import 'package:app_demo_get/shared/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemCategories extends StatefulWidget {
  final String label;
  final String imgUrl;

  ItemCategories({
    @required this.label,
    @required this.imgUrl,
  });

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<ItemCategories> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      width: 110,
      height: 178,
      decoration: BoxDecoration(
        color: isSelected ? AppColor.primary : AppColor.background,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[100],
            blurRadius: 25.0,
            spreadRadius: 6.0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(widget.imgUrl),
            Text(
              widget.label,
              style: TextStyle(fontSize: 14, color: AppColor.commonText),
            ),
            RawMaterialButton(
              onPressed: () {},
              elevation: 0,
              fillColor: isSelected ? AppColor.background : AppColor.backButton,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: isSelected ? Colors.black : Colors.white,
              ),
              padding: EdgeInsets.all(10.0),
              shape: CircleBorder(),
            )
          ],
        ),
      ),
    );
  }
}
