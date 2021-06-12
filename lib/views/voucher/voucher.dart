import 'package:app_demo_get/controllers/main-page-controller.dart';
import 'package:flutter/material.dart';

class VoucherPage extends StatefulWidget {
  @override
  _VoucherPageState createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage> {
  @override
  Widget build(BuildContext context) {
    if (MainPageController.instance.token == null ||
        MainPageController.instance.token == '')
      return Container(
        child: Center(child: Text('Không có mã giảm giá nào')),
      );
    else
      return Center(child: Text('List voucher'));
  }
}
