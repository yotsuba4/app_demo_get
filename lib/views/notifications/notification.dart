import 'package:app_demo_get/controllers/notification-controller.dart';
import 'package:app_demo_get/controllers/order-history-controller.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:app_demo_get/views/bill/detail/detail-bill.dart';
import 'package:app_demo_get/views/history/history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  NotificationController notificationController = Get.find();
  OrderHistoryController orderHistoryController =
      Get.put(OrderHistoryController());
  @override
  void initState() {
    super.initState();
    notificationController.fetchNoti();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          child: notificationController.loadNoti.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: notificationController.listNoti.length,
                  itemBuilder: (builder, index) {
                    return buildNotiItem(
                        notificationController.listNoti[index].title,
                        notificationController.listNoti[index].message);
                  }),
        ));
  }

  buildNotiItem(String title, String message) {
    return InkWell(
      onTap: () {
        Get.to(OrderHistory());
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFB6B7B7),
              width: 0.5,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: AppColor.primary,
              radius: 5,
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Color(0xFF4A4B4D), fontWeight: FontWeight.bold),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Text(
                    message,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                      color: Color(0xFF4A4B4D),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
