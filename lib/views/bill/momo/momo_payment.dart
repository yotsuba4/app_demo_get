import 'package:app_demo_get/controllers/cart-controller.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:app_demo_get/views/bill/success/success.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momo_vn/momo_vn.dart';

class MomoPayment extends StatefulWidget {
  @override
  _MomoPaymentState createState() => _MomoPaymentState();
}

class _MomoPaymentState extends State<MomoPayment> {
  MomoVn _momoPay;
  PaymentResponse _momoPaymentResult;
  String _paymentStatus;

  @override
  void initState() {
    super.initState();
    _momoPay = MomoVn();
    _momoPay.on(MomoVn.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _momoPay.on(MomoVn.EVENT_PAYMENT_ERROR, _handlePaymentError);
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: Text('MOMO PAY'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              color: AppColor.primary,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              child: Text('Thanh Toán bằng ví MOMO'),
              onPressed: () async {
                MomoPaymentInfo options = MomoPaymentInfo(
                    partnerCode: 'MOMO6WW920210405',
                    merchantName: "NoName",
                    appScheme: "momo6ww920210405",
                    merchantCode: 'MOMO6WW920210405',
                    amount: 1000,
                    orderId: '12321312',
                    orderLabel: 'Gói dịch vụ ABCD',
                    merchantNameLabel: "TRUNG TÂM fXYZ",
                    fee: 0,
                    description: 'Thanh toán đơn hàng',
                    username: 'phucle2488',
                    partner: 'merchant',
                    extra: "{\"key1\":\"value1\",\"key2\":\"value2\"}",
                    isTestMode: true);
                try {
                  _momoPay.open(options);
                } catch (e) {
                  debugPrint(e);
                }
              },
            ),
            Text(_paymentStatus ?? "CHƯA THANH TOÁN")
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _momoPay.clear();
  }

  void _setState() {
    _paymentStatus = 'Đã chuyển thanh toán';
    if (_momoPaymentResult.isSuccess) {
      CartController.instance.addToBill();
      /* _paymentStatus += "\nTình trạng: Thành công.";
      _paymentStatus += "\nSố điện thoại: " + _momoPaymentResult.phoneNumber;
      _paymentStatus += "\nExtra: " + _momoPaymentResult.extra;
       _paymentStatus += "\nToken: " + _momoPaymentResult.token; */
    } else {
      _paymentStatus += "\nTình trạng: Thất bại.";
      _paymentStatus += "\nExtra: " + _momoPaymentResult.extra;
      _paymentStatus += "\nMã lỗi: " + _momoPaymentResult.status.toString();
    }
  }

  void _handlePaymentSuccess(PaymentResponse response) {
    setState(() {
      _momoPaymentResult = response;
      _setState();
    });

    print("THÀNH CÔNG: " + response.phoneNumber);
  }

  void _handlePaymentError(PaymentResponse response) {
    setState(() {
      _momoPaymentResult = response;
      _setState();
    });
    print("THẤT BẠI: " + response.message.toString());
  }
}
