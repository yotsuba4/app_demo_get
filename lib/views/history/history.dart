import 'package:app_demo_get/controllers/order-history-controller.dart';
import 'package:app_demo_get/models/order-history.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:app_demo_get/views/restaurant/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  OrderHistoryController orderHistoryController =
      Get.put(OrderHistoryController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              brightness: Brightness.dark,
              iconTheme: IconThemeData(
                color: Colors.white, //change your color here
              ),
              titleSpacing: 0,
              backgroundColor: AppColor.primary,
              title: Text(
                'order_history'.tr,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              bottom: TabBar(
                isScrollable: true,
                indicatorColor: Colors.white,
                tabs: [
                  Tab(
                    text: 'all'.tr,
                  ),
                  Tab(
                    text: 'processing'.tr,
                  ),
                  Tab(
                    text: 'confirmed'.tr,
                  ),
                  Tab(
                    text: 'paid'.tr,
                  ),
                  Tab(
                    text: 'cancelled'.tr,
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                orderHistoryController.loadHis.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: orderHistoryController.listOrder.length,
                        itemBuilder: (builder, index) {
                          return buildHitoryItem(
                              orderHistoryController.listOrder[index]);
                        }),
                ListView.builder(
                    itemCount: 10,
                    itemBuilder: (builder, index) {
                      return buildHitoryItem(
                          orderHistoryController.listOrder[index]);
                    }),
                ListView.builder(
                    itemCount: 10,
                    itemBuilder: (builder, index) {
                      return buildHitoryItem(
                          orderHistoryController.listOrder[index]);
                    }),
                ListView.builder(
                    itemCount: 10,
                    itemBuilder: (builder, index) {
                      return buildHitoryItem(
                          orderHistoryController.listOrder[index]);
                    }),
                ListView.builder(
                    itemCount: 10,
                    itemBuilder: (builder, index) {
                      return buildHitoryItem(
                          orderHistoryController.listOrder[index]);
                    })
              ],
            ),
          ),
        ));
  }

  Widget buildHitoryItem(HisTran his) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.primary),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(his.sId),
          Divider(
            thickness: 0.5,
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(his.restaurant.banner),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(his.restaurant.restaurantName),
                  Text('total'.tr + ' : ${his.total}đ'),
                ],
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColor.primary),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'view_detail'.tr,
                      style: TextStyle(color: AppColor.primary, fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    if (his.status == 'đang xử lý')
                      print('hủy bill');
                    else
                      Get.to(RestaurantPage(his.restaurant));
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.primary),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        his.status == 'đang xử lý'
                            ? 'cancel'.tr
                            : 're_order'.tr,
                        style: TextStyle(color: AppColor.primary, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
