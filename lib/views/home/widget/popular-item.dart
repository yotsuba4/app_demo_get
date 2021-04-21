import 'package:app_demo_get/shared/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PopularFoods extends StatefulWidget {
  final String imgUrl;
  final String title;
  final String resName;
  final num price;
  final num rating;
  PopularFoods(
      {@required this.imgUrl,
      @required this.rating,
      @required this.price,
      @required this.title,
      @required this.resName});

  @override
  _PopularFoodsState createState() => _PopularFoodsState();
}

class _PopularFoodsState extends State<PopularFoods> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      height: 171,
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey[100],
            blurRadius: 25.0,
            spreadRadius: 6.0,
          ),
        ],
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(child: Image.network(widget.imgUrl)),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/crown.png'),
                        Text(
                          'Top of the week',
                          style: TextStyle(
                              color: AppColor.commonText, fontSize: 14),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Text(
                      widget.title,
                      style: TextStyle(
                          color: AppColor.commonText,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '${widget.price} \đ',
                    ),
                    Text(widget.resName),
                    SizedBox(
                      width: 13,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Image.asset('assets/images/star.png'),
                  Text('${widget.rating}'),
                  SizedBox(
                    width: 15,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 90, height: 50),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: AppColor.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topLeft: Radius.circular(20)))),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
