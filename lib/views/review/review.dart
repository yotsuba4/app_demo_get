import 'package:app_demo_get/models/object/food-object.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewPage extends StatelessWidget {
  final Foods food;
  ReviewPage(this.food);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          titleSpacing: 0,
          backgroundColor: AppColor.primary,
          title: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    food.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                food.foodName,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: 'rating'.tr,
              ),
              Tab(
                text: 'review'.tr,
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: Text('1'),
            ),
            Container(
              child: Text('2'),
            )
          ],
        ),
      ),
    );
  }
}
