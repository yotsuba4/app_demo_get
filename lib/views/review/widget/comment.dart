import 'package:app_demo_get/apimodule/customer/api-show-rate.dart';
import 'package:app_demo_get/controllers/rate-controller.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:get/get.dart';

class CommentPage extends StatefulWidget {
  final String foodID;
  CommentPage(this.foodID);
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  ScrollController scrollController = ScrollController();
  int p;
  @override
  void initState() {
    super.initState();
    p = 1;
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          RateController.instance.listComment.length <
              ApiGetRate.countComment) {
        p++;
        RateController.instance.fetchAllComment(widget.foodID, p.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'all'.tr + ' (${ApiGetRate.countComment})',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
                controller: scrollController,
                itemCount: RateController.instance.listComment.length,
                itemBuilder: (builder, index) {
                  return Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(RateController
                                    .instance.listComment[index].user.avatar),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              RateController
                                  .instance.listComment[index].user.fullName,
                              style: TextStyle(fontSize: 16),
                            ),
                            Expanded(child: SizedBox()),
                            Icon(Icons.more_vert_rounded),
                          ],
                        ),
                        Row(
                          children: [
                            Text(RateController
                                .instance.listComment[index].dateCreate),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            RateController.instance.listComment[index].message,
                            maxLines: 5,
                          ),
                        ),
                        Divider(
                          thickness: 0.5,
                          height: 20,
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
