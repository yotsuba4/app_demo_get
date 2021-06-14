import 'package:app_demo_get/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const kTextColor = Color(0xFF757575);
const kAnimationDuration = Duration(milliseconds: 200);
final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);
final RegExp userNameValidatorRegExp = RegExp("[a-zA-z0-9]{6,12}");
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
String kUserNameNullError = "kUserNameNullError".tr;
String kInvalidUserNameError = "kInvalidUserNameError".tr;
String kEmailNullError = "kEmailNullError".tr;
String kInvalidEmailError = "kInvalidEmailError".tr;
String kPassNullError = "kPassNullError".tr;
String kShortPassError = "kShortPassError".tr;
String kMatchPassError = "kMatchPassError".tr;
String kNamelNullError = "kNamelNullError".tr;
String kPhoneNumberNullError = "kPhoneNumberNullError".tr;
String kAddressNullError = "kAddressNullError".tr;

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
