import 'package:app_demo_get/components/custom-text.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color txtColor;
  final Color bgColor;
  final Color shadowColor;
  final Function onTap;

  const CustomButton(
      {Key key,
      @required this.text,
      this.txtColor,
      this.bgColor,
      this.shadowColor,
      @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
        child: PhysicalModel(
          color: Colors.grey.withOpacity(.4),
          elevation: 2,
          borderRadius: BorderRadius.circular(20),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: bgColor ?? AppColor.primary,
              ),
              child: Container(
                margin: EdgeInsets.all(14),
                alignment: Alignment.center,
                child: CustomText(
                  text: text,
                  color: txtColor ?? Colors.white,
                  size: 18,
                  weight: FontWeight.normal,
                ),
              )),
        ),
      ),
    );
  }
}
