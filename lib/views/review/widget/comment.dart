import 'package:app_demo_get/shared/color.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tất cả (200 lượt xếp hạng)',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 30,
                itemBuilder: (builder, index) {
                  return Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                    'https://res.cloudinary.com/ducsine/image/upload/v1620808216/iv2rjt6cm5b2mueqkmfq.jpg'),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              'Lê Hồng Phúc',
                              style: TextStyle(fontSize: 16),
                            ),
                            Expanded(child: SizedBox()),
                            Icon(Icons.more_vert_rounded),
                          ],
                        ),
                        Row(
                          children: [
                            Text('11/06/2021'),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Món này rất ngon tôi sẽ lại ghé quán trong một tương lai không xa để có thể tiếp tục được thưởng thức hương vị từ lúa ngô thịt đậm đà mà nó mang lại gợi lên nhiều cung bậc cảm xúc lạ thường',
                          maxLines: 5,
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
