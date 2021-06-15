import 'package:app_demo_get/controllers/auth-controller.dart';
import 'package:app_demo_get/controllers/location-controller.dart';
import 'package:app_demo_get/shared/color.dart';
import 'package:app_demo_get/spref/constain.dart';
import 'package:app_demo_get/spref/spref.dart';
import 'package:app_demo_get/views/home/home-page.dart';
import 'package:app_demo_get/views/notifications/notification.dart';
import 'package:app_demo_get/views/profile/profile.dart';
import 'package:app_demo_get/views/sign-in/sign-in.dart';
import 'package:app_demo_get/views/voucher/voucher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  AuthController authController = Get.put(AuthController());
  GeoLocationController geoLocationController =
      Get.put(GeoLocationController());
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: Size(360, 640),
      orientation: Orientation.portrait,
    );
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
            icon: Icon(
              Icons.location_on,
              color: Colors.white,
            ),
            onPressed: () {
              geoLocationController.determinePosition();
            }),
        title: Obx(() => Text(geoLocationController.currentAddress.value,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white,
            ))),
        backgroundColor: AppColor.primary,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColor.primary,
        unselectedItemColor: Colors.grey.shade300,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        currentIndex: _currentIndex,
        onTap: (index) async {
          var token = await SPref.get(SPrefCache.KEY_TOKEN);
          if (index == 3) {
            if (token == null || token == '')
              Get.to(SignInPage());
            else {
              authController.getProfile();
              Get.to(ProfileScreen());
            }
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "hot".tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pageview),
            label: "voucher".tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important),
            label: "notification".tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_ind),
            label: "profile".tr,
          )
        ],
        type: BottomNavigationBarType.fixed,
      ),
      body: getBodyWidget(),
    );
  }

  getBodyWidget() {
    if (_currentIndex == 0) {
      return HomePage();
    } else if (_currentIndex == 1) {
      return VoucherPage();
    } else {
      return NotificationPage();
    }
  }
}
