import 'package:app_demo_get/apimodule/customer/api-show-rate.dart';
import 'package:app_demo_get/controllers/rate-controller.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:get/get.dart';

class RatePage extends StatefulWidget {
  final String foodID;
  RatePage(this.foodID);
  @override
  _RatePageState createState() => _RatePageState();
}

class _RatePageState extends State<RatePage> {
  ScrollController scrollController = ScrollController();
  int p;
  @override
  void initState() {
    super.initState();
    p = 1;
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          RateController.instance.listRate.length < ApiGetRate.countRate) {
        p++;
        RateController.instance.fetchAllRate(widget.foodID, p.toString());
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
            'all'.tr + ' (${ApiGetRate.countRate})',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
                controller: scrollController,
                itemCount: RateController.instance.listRate.length,
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
                                    .instance.listRate[index].user.avatar),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              RateController
                                  .instance.listRate[index].user.fullName,
                              style: TextStyle(fontSize: 16),
                            ),
                            Expanded(child: SizedBox()),
                            Icon(Icons.more_vert_rounded),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 2),
                              child: SmoothStarRating(
                                isReadOnly: true,
                                allowHalfRating: true,
                                color: AppColor.primary,
                                borderColor: AppColor.primary,
                                rating: RateController
                                    .instance.listRate[index].rate
                                    .toDouble(),
                                size: 15,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(RateController
                                .instance.listRate[index].dateCreate),
                          ],
                        ),
                        /*  SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Món này rất ngon tôi sẽ lại ghé quán trong một tương lai không xa để có thể tiếp tục được thưởng thức hương vị từ lúa ngô thịt đậm đà mà nó mang lại gợi lên nhiều cung bậc cảm xúc lạ thường',
                          maxLines: 5,
                        ), */
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
