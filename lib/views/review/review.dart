import 'package:app_demo_get/controllers/rate-controller.dart';
import 'package:app_demo_get/models/object/food-object.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:app_demo_get/views/review/widget/comment.dart';
import 'package:app_demo_get/views/review/widget/rate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewPage extends StatefulWidget {
  final Foods food;
  ReviewPage(this.food);

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  void initState() {
    super.initState();
    RateController.instance.listRate.clear();
    RateController.instance.listComment.clear();
    RateController.instance.fetchAllRate(widget.food.sId, '1');
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => DefaultTabController(
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
                        widget.food.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.food.foodName,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              bottom: TabBar(
                onTap: (index) {
                  if (index == 1) {
                    if (RateController.instance.listComment.length < 1) {
                      RateController.instance
                          .fetchAllComment(widget.food.sId, '1');
                    }
                  }
                },
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
              physics: NeverScrollableScrollPhysics(),
              children: [
                RateController.instance.loadingListRate.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : RatePage(widget.food.sId),
                RateController.instance.loadingListComment.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : CommentPage(widget.food.sId),
              ],
            ),
          ),
        ));
  }
}
