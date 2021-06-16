import 'package:app_demo_get/controllers/rate-controller.dart';
import 'package:app_demo_get/models/object/food-object.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostComment extends StatefulWidget {
  final Foods food;
  PostComment(this.food);

  @override
  _PostCommentState createState() => _PostCommentState();
}

class _PostCommentState extends State<PostComment> {
  TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: commentController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'hint_comment'.tr,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  RateController.instance
                      .postComment(widget.food, commentController.text);
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width - 100,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.primary,
                ),
                child: Center(
                    child: Text(
                  'post_comment'.tr,
                  style: TextStyle(color: Colors.white),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
